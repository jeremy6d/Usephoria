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

  get "static/dashboard"
  get "static/testerDashboard"
  get "static/howItWorks"
  get "static/test"
  get "static/newTest"
  get "static/landing"
  root :to => "static#landing"
end
