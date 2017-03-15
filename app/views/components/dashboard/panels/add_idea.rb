module Components
  module Dashboard
    module Panels
      class AddIdea < Panel
        def render
          div(style: styles) do
            'add an idea here!'
          end
        end
      end
    end
  end
end
