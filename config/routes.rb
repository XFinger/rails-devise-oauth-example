DeviseOauth::Application.routes.draw do


  resources :authentications
  match '/auth/:provider/callback' => 'authentications#create'
  resources :posts

  devise_for :users, :controllers => { :authentications => 'registrations' }
  root :to => 'authentications#index'
 
end
