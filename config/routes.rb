Usephoria::Application.routes.draw do
  scope "clients" do
    resources :ab, as: "ab_tests", controller: "ab_tests", except: :index
    resources :yes_or_no, as: "yn_tests", controller: "yes_or_no_tests", except: :index
    root to: "test_definitions#index", as: :clients_root
  end

  scope "testers" do
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
