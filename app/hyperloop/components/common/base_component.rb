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

    def put_data(endpoint, data, &block)
      puts "posting to #{api_endpoint(endpoint)}"
      payload = {json: data.to_json}
      HTTP.post(
        api_endpoint(endpoint),
        payload: payload
      )
      block.call
    end

    def mutator_proc(param, attr)
      Proc.new do |value|
        params.send(param.to_sym).send("#{attr}=".to_sym, value)
        force_update!
      end
    end

    render do
      'hi'
    end
  end
end
