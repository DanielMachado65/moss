# Helper methods aux
module Moss
  class App
    module FileHelper

      def read_file64(params)
        json = JSON.parse(params)
        return Base64.decode64(json['content']).to_s
      end

      def save_file_tmp(params)
        # decodificar o arquivo
        json = JSON.parse(params)
        decoded_data = Base64.decode64(json['content'])

        # criar pasta temporária
        tmp = Dir.tmpdir()
        file = File.new(".#{tmp}/#{json['name']}-#{generate_hash}.pas", 'w')

        # escreve no arquivo
        file.write(decoded_data.force_encoding('UTF-8'))
        file.close
      end

      private

      def generate_hash
        o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
        (0...50).map { o[rand(o.length)] }.join
      end

      def remove_characters(string)
        string.remove('data:image/jpeg;base64,', 'data:image/png;base64,', 'data:image/gif;base64,')
      end

    end
    helpers FileHelper
  end
end
