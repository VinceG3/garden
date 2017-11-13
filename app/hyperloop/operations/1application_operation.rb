class ApplicationOperation < Hyperloop::Operation
  def full_route
    params.api_url + '/' + params.route
  end
end