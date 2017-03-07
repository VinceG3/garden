Rails.application.routes.draw do
  get 'home', to: 'home#show'
  get 'dashboard', to: 'dashboard#show'
end
