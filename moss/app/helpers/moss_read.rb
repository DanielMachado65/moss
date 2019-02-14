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
    end
    helpers MossHelper
  end
end
