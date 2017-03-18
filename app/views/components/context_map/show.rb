module Components
  module ContextMap
    class Show < Common::BaseComponent
      param :api_url

      before_mount do
        @@api_url = params.api_url
        state.context!({
          topic: '',
          elements: {
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

      def on_element_add(name)
        new_context = state.context
        new_context[:elements][name] = []
        state.context! new_context
      end

      def render
        div(style: styles) do
          Context(
            context: state.context,
            on_element_add: method(:on_element_add).to_proc,
          )
        end
      end
    end
  end
end
