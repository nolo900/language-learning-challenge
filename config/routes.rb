Rails.application.routes.draw do
  resources :proficiencies
  resources :messages
  resources :languages
  resources :users

  root to: 'application#index'
  match "*path" => "application#error", via: [:get, :post]
end
