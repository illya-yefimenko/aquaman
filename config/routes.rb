Rails.application.routes.draw do

  get 'projects/home'
  devise_for :users
  get 'historical_values/destroy'
  root "devices#index"

  namespace :api do
    namespace :v1 do
      resources :devices, only: [:show]
      resources :properties, only: [:update]
    end
  end

  resources :devices do
    resources :properties
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
