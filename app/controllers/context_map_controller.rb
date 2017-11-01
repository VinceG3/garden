class ContextMapController < ApplicationController
  def show
    if topic.parameterize != params[:topic]
      redirect_to "/context-map/#{topic.parameterize}"
      return
    end
    passed = params[:elements] ? params[:elements].split(',') : nil
    render_component(**base_params.merge(
      topic: topic,
      component_name: 'context',
      endpoint: topic.parameterize,
      passed_elements: passed
    ))
  end

  def list
    render_component(**base_params.merge(
      component_name: 'context_list',
      endpoint: 'all',
    ))    
  end

  private

  def topic
    params[:topic].titleize
  end
end
