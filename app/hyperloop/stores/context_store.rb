class ContextStore < ApplicationStore
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
    step   {|response| puts response }
  end

  receives ApiGet do |*arguments|
    puts arguments
    mutate.context
  end

  state :context, reader: true, scope: :class

  def self.init(api_url)
    ApiGet.run(route: 'context/Self', api_url: api_url)
  end

  def self.init_test(data)
    init(data)
  end

  def self.to_hash
    state.context.to_hash
  end
end
