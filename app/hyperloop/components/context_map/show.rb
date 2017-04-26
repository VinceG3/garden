module ContextMap
  class Show < Common::BaseComponent
    param :api_url

    after_mount do
      @@api_url = params.api_url
      ContextStore.init(@@api_url)
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
