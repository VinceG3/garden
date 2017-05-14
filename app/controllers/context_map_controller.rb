class ContextMapController < ApplicationController
  def show
    render_component(**base_params.merge(topic: params[:topic]))
  end
end
