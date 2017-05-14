module ContextMap
  class Show < Common::BaseComponent
    param :api_url
    param :topic

    after_mount do
      @@api_url = params.api_url
      ContextStore.init(@@api_url, self, params.topic)
    end

    def render
      if ContextStore.context
        div(class: 'show') do
          Context(context: ContextStore.context)
        end
      end
    end
  end
end
