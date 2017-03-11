module Components
  module Common
    class BaseComponent < React::Component::Base
      def api_endpoint(route)
        "#{api_url}/#{route}"
      end

      def api_url
        @@api_url
      end

      render do
        'hi'
      end
    end
  end
end