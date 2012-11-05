require "spec_helper"

describe ProductLogsController do
  describe "routing" do

    it "routes to #index" do
      get("/product_logs").should route_to("product_logs#index")
    end

    it "routes to #new" do
      get("/product_logs/new").should route_to("product_logs#new")
    end

    it "routes to #show" do
      get("/product_logs/1").should route_to("product_logs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/product_logs/1/edit").should route_to("product_logs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/product_logs").should route_to("product_logs#create")
    end

    it "routes to #update" do
      put("/product_logs/1").should route_to("product_logs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/product_logs/1").should route_to("product_logs#destroy", :id => "1")
    end

  end
end
