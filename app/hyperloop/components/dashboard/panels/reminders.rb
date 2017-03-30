module Dashboard
  module Panels
    class Reminders < Panel
      def render
        div(style: styles) do
          'do the thing!'
        end
      end
    end
  end
end
