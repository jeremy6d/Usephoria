Usephoria::Application.routes.draw do
  namespace "clients" do
    resources :ab, as: "ab_tests", controller: "ab_tests", except: :index
    resources :yes_or_no, as: "yn_tests", controller: "yes_or_no_tests", except: :index
    root to: "test_definitions#index"
  end

  scope "testers" do
    root to: 'tests_controller#index'
  end

  devise_for :users

  get "static/dashboard"
  get "static/testerDashboard"
  get "static/test"
  get "static/newTest"
  get "static/landing"
  root :to => "static#landing"
end
