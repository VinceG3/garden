module Components
  module Dashboard
    module Panels
      class Ingest < Panel
        def render
          div(style: styles) do
            Common::ButtonWrapper()
          end
        end
      end
    end
  end
end