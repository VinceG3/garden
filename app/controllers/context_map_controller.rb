class ContextMapController < ApplicationController
  def show
    render_component(**base_params.merge(
      topic: params[:topic],
      component_name: 'context',
      passed_elements: params[:elements].split(',')
    ))
  end
end
