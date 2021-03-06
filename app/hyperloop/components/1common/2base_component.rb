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

    def self.set_store(store_class, passed_in: nil)
      after_mount do
        @@api_url = params.api_url
        extra_params = passed_in ? params.send(passed_in) : nil
        self.class.const_get(store_class).init(
          api_url: @@api_url,
          component: self,
          endpoint: params.endpoint,
          component_name: params.component_name,
          passed: extra_params
        )
      end
    end
  end
end
