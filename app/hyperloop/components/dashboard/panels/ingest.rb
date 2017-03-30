module Dashboard
  module Panels
    class Ingest < Panel
      def render
        div(style: styles) do
          Common::ButtonWrapper(
            endpoint: 'ingest',
            click_cb: method(:on_button_click).to_proc,
            text: 'Ingest!'
          )
        end
      end

      def on_button_click(resp)
        puts resp['data']
      end
    end
  end
end
