Usephoria::Application.routes.draw do
  
  resources :test_definitions

  devise_for :users do 
    get "/", :to => "devise/registrations#new"
  end

  get "static/dashboard"

  root :to => "devise/registrations#new"
end
