# class ApiGet < Hyperloop::Operation
#   param :route, type: String
#   outbound :data
#   step { HTTP.get(params.route) }
#   step {|response| puts response }
# end
