class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def menu
    render_component(**base_params)
  end

  private

  def base_params
    {
      api_url: ENV['API_URL']
    }
  end
end
