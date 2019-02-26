#!/usr/bin/env ruby
Moss::App.controllers :main do
  get '/' do
    api_sucess(params)
  end

  get '/enviar' do
    @file = nil
    render 'index'
  end

  post '/' do
    path = destination(params[:file][:name])

    # escreve o arquivo no local designado
    File.open(path, 'w') do |f|
      f.write(params[:file][:tempfile])
    end

    api_sucess('o arquivo foi gravado com sucesso')
  end

  patch '/processamento' do
    path = destination(params[:file][:name])
    file = File.readlines(path)

  end
end
