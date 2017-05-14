class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def menu
    render_component(**base_params)
  end

  def component
    component_name = params[:component].capitalize
    render_component(component_name, **base_params.merge(uid: params[:uid]))
  end

  private

  def base_params
    {
      api_url: ENV['API_URL']
    }
  end
end
