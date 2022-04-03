Rails.application.routes.draw do
  resources :orders
  resources :shoppers
  resources :merchants
  resources :imports
  
  namespace :api do
    namespace :v1 do
      get 'disbursements', to: 'disbursements#index'
    end
  end
end
