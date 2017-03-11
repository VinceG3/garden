Rails.application.routes.draw do
  root to: 'dashboard#show'
  get 'home', to: 'home#show'
  get 'dashboard', to: 'dashboard#show'
end
