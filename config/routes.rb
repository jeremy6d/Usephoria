Usephoria::Application.routes.draw do
  devise_for :users do 
    get "/", :to => "devise/registrations#new"
  end

  get "static/dashboard"

  root :to => "devise/registrations#new"
end
