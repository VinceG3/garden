class DashboardController < ApplicationController
  def show
    render_component(**base_params)
  end
end