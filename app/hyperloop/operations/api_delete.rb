class ApiDelete < ApplicationOperation
  param :route, type: String
  param :api_url, type: String
  outbound :data


  step   { puts "making api get request to: #{full_route}" }
  step   { HTTP.delete(full_route) }
  failed {|exception| puts "couldn't make request!"; puts exception }
  step   {|response| params.data = response.json }
end
