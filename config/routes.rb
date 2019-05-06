Rails.application.routes.draw do

  namespace :api do

    namespace :v1 do

      resources :product_types

      resources :products  do

        member do

          post 'set_price'
          get 'get_price'

        end

      end

    end

  end

  resources :users, param: :email

  post '/users/auth/login', to: 'user_authentication#login'

end
