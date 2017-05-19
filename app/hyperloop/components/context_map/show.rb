module ContextMap
  class Show < Common::BaseComponent
    param :api_url
    param :topic
    param :component_name
    param :passed_elements
    set_store 'ContextStore'

    def render
      if ContextStore.context
        div(class: 'show') do
          Context(
            context: ContextStore.context
          )
        end
      end
    end
  end
end
