class ContextMapController < ApplicationController
  def show
    passed = params[:elements] ? params[:elements].split(',') : nil
    render_component(**base_params.merge(
      topic: params[:topic],
      component_name: 'context',
      passed_elements: passed
    ))
  end
end
