module Common
  class BaseComponent < Hyperloop::Component
    def api_endpoint(route)
      "#{api_url}/#{route}"
    end

    def api_url
      @@api_url
    end

    def get_data(endpoint, &block)
      puts "retrieving #{route = api_endpoint(endpoint)}"
      HTTP.get(route, &block)
    end

    render do
      'hi'
    end
  end
end
