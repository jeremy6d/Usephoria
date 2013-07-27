Usephoria::Application.routes.draw do
  
  resources :tests

  devise_for :users do 
    get "/", :to => "devise/registrations#new"
  end

  root :to => "devise/registrations#new"
end
