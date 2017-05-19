class ApplicationStore < Hyperloop::Store
  class ApiGet < Hyperloop::Operation
    param :route, type: String
    param :api_url, type: String
    outbound :data

    def full_route
      params.api_url + '/' + params.route
    end

    step   { puts "making api request to: #{full_route}" }
    step   { HTTP.get(full_route) }
    failed {|exception| puts "couldn't make request!"; puts exception }
    step   {|response| params.data = response.json }
  end

  class ApiPut < Hyperloop::Operation
    param :route, type: String
    param :api_url, type: String
    param :data, type: Hash

    def full_route
      params.api_url + '/' + params.route
    end

    def payload
      { json: params.data }
    end

    step { puts "making api request to: #{full_route}" }
    step { HTTP.post(full_route, payload: payload).then { |response| puts 'success!'; response}.fail { |http| debugger; nil }}
    step {|response| params.data = response.json }
  end

  def self.init(api_url:, component:, endpoint:, component_name:, extra_params: nil)
    endpoint ||= 'Self'
    @api_url = api_url
    @component = component
    @component_name = component_name
    @extra_params = extra_params
    set_getter
    ApiGet.run(route: "#{component_name}/#{endpoint}", api_url: @api_url)
  end

  def self.set_state(data, key)
    begin
      `eval(#{"self.$mutate().$#{key}(data);"})` # calling mutate dynamically
    rescue StandardError => e
      puts e, e.class.name
      e.backtrace.each {|line| puts line }
    end
  end

  def self.set_getter
    receives(ApiGet) do
      begin
        entity_class_name = self.name.gsub(/Store/, '')
        entity_class = Entities.const_get(entity_class_name)
        set_state(entity_class.from_hash(params.data), entity_class_name.downcase)
      rescue StandardError => e
        e.backtrace.unshift("#{e} (#{e.class.name})").each{|line| puts line }
      end
    end
  end
end