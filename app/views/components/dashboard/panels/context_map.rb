module Components
  module Dashboard
    module Panels
      class ContextMap < Panel
        def render
          div(style: styles) do
            'I\'m the whole world!!'
          end
        end
      end
    end
  end
end
