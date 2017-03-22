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

      def on_element_add(name)
        new_context = state.context
        new_context[:elements][name] = []
        state.context! new_context
      end

      def render
        div(class: 'show') do
          Context(
            context: state.context,
            on_element_add: method(:on_element_add).to_proc,
          )
        end
      end
    end
  end
end
