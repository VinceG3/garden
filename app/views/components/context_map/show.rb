module Components
  module ContextMap
    class Show < Common::BaseComponent
      param :api_url

      before_mount do
        @@api_url = params.api_url
      end

      def render
        div(class: 'show') do
          Context()
        end
      end
    end
  end
end
