require "spec_helper"

describe YesOrNoTestsController do
  describe "routing" do

    it "routes to #index" do
      get("/yes_or_no_tests").should route_to("yes_or_no_tests#index")
    end

    it "routes to #new" do
      get("/yes_or_no_tests/new").should route_to("yes_or_no_tests#new")
    end

    it "routes to #show" do
      get("/yes_or_no_tests/1").should route_to("yes_or_no_tests#show", :id => "1")
    end

    it "routes to #edit" do
      get("/yes_or_no_tests/1/edit").should route_to("yes_or_no_tests#edit", :id => "1")
    end

    it "routes to #create" do
      post("/yes_or_no_tests").should route_to("yes_or_no_tests#create")
    end

    it "routes to #update" do
      put("/yes_or_no_tests/1").should route_to("yes_or_no_tests#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/yes_or_no_tests/1").should route_to("yes_or_no_tests#destroy", :id => "1")
    end

  end
end
