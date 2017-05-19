module Application
  class Menu < Common::ApplicationComponent
    param :api_url

    before_mount do
      @@api_url = params.api_url
    end

    def render
      div do
        p { Common::Link(text: 'Dashboard', url: '/dashboard') }
        p { Common::Link(text: 'Context Map', url: '/context-map') }
      end
    end
  end
end
