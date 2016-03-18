Rails.application.routes.draw do
  namespace :v1, defaults: {format: 'json'} do
    post '/inbound' => "incoming#inbound"
  end
  get 'auth/:provider/callback', to: 'sessions#create'
  resources :sessions, only: [:create]
end
