Rails.application.routes.draw do
  devise_for :users

  root 'projects#index'
  get 'historical_values/destroy'

  namespace :api do
    namespace :v1 do
      resources :devices, only: [:show]
      resources :properties, only: [:update]
    end
  end
  resources :projects do
    resources :devices, shallow: true do
      resources :properties, shallow: true
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
