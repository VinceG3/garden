module Dashboard
  module Panels
    class ContextMap < Panel
      def render
        div(style: styles) do
          a(href: '/context-map') { "get contextual!" }
        end
      end
    end
  end
end
