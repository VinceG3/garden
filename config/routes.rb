# /config/routes.rb
Rails.application.routes.draw do
  root to: 'dashboard#show'
  get '/home', to: 'home#show'
  get '/dashboard', to: 'dashboard#show'
  get '/menu', to: 'application#menu'
  get '/context-map', to: 'context_map#show'
  get '/context-map/:topic', to: 'context_map#show'
  get '/projects', to: 'projects#show'
  get '/:component(/:uid)', to: 'application#component'

  mount Hyperloop::Engine => '/hyperloop'
end
