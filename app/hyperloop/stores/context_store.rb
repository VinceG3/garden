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

    step   { puts "making api request to: #{full_route}" }
    step   { HTTP.put(full_route, payload: payload) }
    failed {|exception| puts "couldn't make request!"; puts exception }
    step   {|response| params.data = response.json }
  end

  receives ApiGet do
    begin
      context = Entities::Context.from_hash(params.data)
      mutate.context context
    rescue StandardError => e
      puts e
      e.backtrace.each {|line| puts line }
    end
  end

  state :context, reader: true, scope: :class

  def self.init(api_url)
    @api_url = api_url
    ApiGet.run(route: 'context/Self', api_url: @api_url)
  end

  def self.init_test(data)
    init(data)
  end

  def self.to_hash
    state.context.to_hash
  end

  def self.save
    ApiPut.run(route: 'context', api_url: @api_url, data: to_hash)
  end
end
