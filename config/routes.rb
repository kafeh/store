Rails.application.routes.draw do
 
 namespace :api do

  namespace :v1 do

  	resources :product_types

  	resources :users

  	resources :products
  	
  end

 end

end
