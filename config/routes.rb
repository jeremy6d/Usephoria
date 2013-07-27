Usephoria::Application.routes.draw do
  devise_for :users do 
    get "/", :to => "devise/registrations#new"
  end

  root :to => "devise/registrations#new"
end
