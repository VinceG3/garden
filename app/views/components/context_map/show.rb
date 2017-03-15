module Components
  module ContextMap
    class Show < Common::BaseComponent
      param :api_url

      before_mount do
        @@api_url = params.api_url
        state.context!({
          topic: 'Self',
          elements: {
            'Consciousness' => [],
            'Form' => [],
            'Goals' => [],
          }
        })
      end

      def styles
        {
          border: '1px solid black',
          width: '400px',
          height: '400px',
          margin: '0 auto',
          borderRadius: '10px',
        }
      end

      def render
        div(style: styles) do
          Context(context: state.context)
        end
      end
    end
  end
end
