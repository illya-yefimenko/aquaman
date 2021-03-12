Rails.application.routes.draw do
  get 'water_level/shouldfill'
  get 'water_level/index'
  get 'floats/read'
  get 'floats/write'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
