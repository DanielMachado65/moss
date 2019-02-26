# Helper methods aux
module Moss
  class App
    module MossHelper
      def api_sucess(data = {})
        status 200
        { code: 200, data: data }.to_json
      end

      def api_unsucess(data = {})
        status 400
        { code: 400, error: data }.to_json
      end

      def api_error_compile(msg)
        status 200
        { code: 200, error: ' Não foi declarado: ' + msg }.to_json
      end

      def destination(file)
        File.join(Padrino.root, 'public/files', file) if file.is_a? String && !file.empty?
      end
    end
    helpers MossHelper
  end
end
