module ContextMap
  class Show < Common::BaseComponent
    param :api_url

    before_mount do
      @@api_url = params.api_url
      ContextStore.init_test
    end

    def render
      div(class: 'show') do
        Context(context: ContextStore.context)
      end
    end
  end
end