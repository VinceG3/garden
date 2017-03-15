module Components
  module Common
    class ButtonWrapper < BaseComponent
      def click_action
        HTTP.post(api_endpoint('ingest')) do |resp|
          click_callback(JSON.parse(resp.body))
        end
      end

      def click_callback(resp)
        puts resp['data']
      end

      def render
        button { 'Ingest!' }.on(:click) do
          click_action
        end
      end
    end
  end
end
