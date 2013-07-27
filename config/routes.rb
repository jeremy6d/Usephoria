Usephoria::Application.routes.draw do
  
  resources :test_definitions

  devise_for :users #do 
    #get "/", :to => "devise/registrations#new"
  #end

  get "static/dashboard"
  get "static/landing"
  root :to => "static#landing"


  #root :to => "devise/registrations#new"
end
