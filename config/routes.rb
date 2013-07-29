Usephoria::Application.routes.draw do
  namespace "clients" do
    resources :ab, as: "ab_tests", controller: "ab_tests", except: :index
    resources :yes_or_no, as: "yn_tests", controller: "yes_or_no_tests", except: :index

    get "results/:test_id" => "results#index", as: "test_results"

    root to: "test_definitions#index"
  end

  namespace "testers" do
    resources :tests, :except => :index do
      resources :results
    end
    
    root to: 'tests#index'
  end

  devise_for :users

  root :to => "static#landing"

  constraints :format => "html" do
    get "/:action" => "static#:action", :as => "static_page"
  end
end
