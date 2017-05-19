module Common
  class BaseComponent < Common::ApplicationComponent
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

    def put_data(endpoint, data, &block)
      puts "posting to #{api_endpoint(endpoint)}"
      payload = {json: data}
      puts payload
      HTTP.post(
        api_endpoint(endpoint),
        payload: payload
      )
      block.call
    end

    def self.set_store(store_class)
      after_mount do
        @@api_url = params.api_url
        self.class.const_get(store_class).init(
          api_url: @@api_url,
          component: self,
          endpoint: params.topic,
          component_name: params.component_name
        )
      end
    end
  end
end
