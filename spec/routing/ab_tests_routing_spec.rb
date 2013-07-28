require "spec_helper"

describe AbTestsController do
  describe "routing" do

    it "routes to #index" do
      get("/ab_tests").should route_to("ab_tests#index")
    end

    it "routes to #new" do
      get("/ab_tests/new").should route_to("ab_tests#new")
    end

    it "routes to #show" do
      get("/ab_tests/1").should route_to("ab_tests#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ab_tests/1/edit").should route_to("ab_tests#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ab_tests").should route_to("ab_tests#create")
    end

    it "routes to #update" do
      put("/ab_tests/1").should route_to("ab_tests#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ab_tests/1").should route_to("ab_tests#destroy", :id => "1")
    end

  end
end
