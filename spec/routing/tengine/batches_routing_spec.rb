require "spec_helper"

describe Tengine::BatchesController do
  describe "routing" do

    it "routes to #index" do
      get("/tengine_batches").should route_to("tengine_batches#index")
    end

    it "routes to #new" do
      get("/tengine_batches/new").should route_to("tengine_batches#new")
    end

    it "routes to #show" do
      get("/tengine_batches/1").should route_to("tengine_batches#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tengine_batches/1/edit").should route_to("tengine_batches#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tengine_batches").should route_to("tengine_batches#create")
    end

    it "routes to #update" do
      put("/tengine_batches/1").should route_to("tengine_batches#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tengine_batches/1").should route_to("tengine_batches#destroy", :id => "1")
    end

  end
end
