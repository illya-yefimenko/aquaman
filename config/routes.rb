Rails.application.routes.draw do

  resources :devices do
    resources :properties
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
