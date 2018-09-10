Rails.application.routes.draw do
  resources :proficiencies
  resources :messages
  resources :languages
  resources :users

  root to: 'application#index'
  match "*path" => "application#route_error", via: [:get, :post]
end
