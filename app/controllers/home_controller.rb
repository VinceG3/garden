class HomeController < ApplicationController
  def show
    # render_component uses the controller name to find the 'show' component.
    render_component say_hello_to: params[:say_hello_to]
  end
end