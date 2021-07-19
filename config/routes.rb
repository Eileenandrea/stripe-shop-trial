Rails.application.routes.draw do
  post  'checkout', to: 'checkout#create', as: 'checkout_create'
  resources :products
  root "products#index"
  resources webhooks, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
