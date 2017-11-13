class ApplicationStore < Hyperloop::Store
  def self.init(api_url:, component:, endpoint:, component_name:, passed: nil)
    endpoint ||= 'Self'
    @api_url = api_url
    @component = component
    @component_name = component_name
    @passed = passed
    set_getter
    ApiGet.run(route: "#{component_name}/#{endpoint}", api_url: @api_url)
  end

  def self.set_state(data, key)
    data = handle_passed(data) if respond_to?(:handle_passed)
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
        set_state(entity_class.from_data(params.data), entity_class_name.underscore)
      rescue StandardError => e
        e.backtrace.unshift("#{e} (#{e.class.name})").each{|line| puts line }
      end
    end
  end
end