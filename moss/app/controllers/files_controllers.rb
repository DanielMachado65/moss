#!/usr/bin/env ruby
Moss::App.controllers :files, provides: %i[json binary] do
  get '/' do
    @item = Item.all
    if @item == []
      api_unsucess('não contém nada')
    else
      api_sucess(@item)
    end
  end

  # HACK: binary
  # code: file[0] - header
  # code: file[1] - variables
  # code: file[2] - code
  post '/' do
    int = 0
    file = read_file64(request.body.read).split("\n").split('')

    # validates possibles errors
    return api_error_compile('PROGRAM') unless validate_header(file[0])

    comments_header = validate_variables(file[1])
    return api_error_compile('VAR') if comments_header[:chave] == false

    variables = cont_variables(file[1])

    save_file_tmp(name: 'pascal', file: file)

    # file.each do |line|
    #   line.remove("\n")
    #   int += 1 if line.include?('int')
    # end

    # return
    static = { int: int }.to_json
  end
end
