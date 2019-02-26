# Helper methods aux
module Moss
  class App
    module CompilerHelper
      # HACK: verificar se o programa tem o nome de inicialização
      def validate_header(reader)
        reader[0].downcase.include?('program')
      end

      def validate_variables(reader)
        comentarios = 0
        reader.each do |line|
          if line.include?('//')
            comentarios += 1
          else
            return { chave: true, comentarios: comentarios } if line.downcase.include?('var')
          end
        end
        { chave: false }
      end

      def remove_coments(_file)
        binding.pry
      end

      # contar as variáveis depois do "VAR"
      def cont_variables(_file)
        variables = _file[(_file.index('VAR') + 1)..-1]
        variables.each do |line|
          linha = line.split(',')
        end
      end
    end
    helpers CompilerHelper
  end
end
