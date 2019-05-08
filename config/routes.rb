Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :product_types
      resources :products  do
        member do
          post 'set_price'
          get 'get_price'
          get 'add_like'
        end

        collection do
          get 'search_by_name', to: 'products#search_by_name'
        end
      end

      resources :orders, only: [:destroy, :show] do 
        collection do
          patch 'buy'
        end
      end  

      resources :order_items, only: [:create, :destroy, :update]    
    end
  end

  resources :users, param: :email
  resources :admins, param: :email

  post '/users/auth/login', to: 'user_authentication#login'
  post '/admins/auth/login', to: 'admin_authentication#login'

end
