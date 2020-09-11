Rails.application.routes.draw do
  get 'price/index'
  devise_for :users
  get 'items/index'
  root to: "items#index"
  resources :items do
  end
end
