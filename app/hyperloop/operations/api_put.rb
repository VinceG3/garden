class ApiPut < ApplicationOperation
  param :route, type: String
  param :api_url, type: String
  param :data, type: Hash

  def payload
    { json: params.data }
  end

  step { puts "making api put request to: #{full_route}" }
  step { HTTP.post(full_route, payload: payload).then { |response| puts 'success!'; response}.fail { |http| debugger; nil }}
  step {|response| params.data = response.json }
end
