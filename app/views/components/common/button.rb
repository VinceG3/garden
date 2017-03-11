module Components
  module Common
    class ButtonWrapper < BaseComponent
      def click_action
        HTTP.post(api_endpoint('ingest')) do |resp|
          click_callback
        end
      end

      def click_callback
      end

      def render
        button { 'Ingest!' }.on(:click) do
          click_action
        end
      end
    end
  end
end