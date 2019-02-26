# Helper methods aux
module Moss
  class App
    module FileHelper

      # leitura de Base64
      def read_file64(params)
        json = JSON.parse(params)
        return Base64.decode64(json['content']).to_s
      end

      # criar pasta temporária
      def save_file_tmp(article = {})
        tmp = Dir.tmpdir()
        file = File.new(".#{tmp}/#{generate_hash}.pas", 'w')

        file.write(article[:file])
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
