require "rails_helper"

RSpec.describe ComplaintsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/complaints").to route_to("complaints#index")
    end

    it "routes to #show" do
      expect(:get => "/complaints/1").to route_to("complaints#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/complaints").to route_to("complaints#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/complaints/1").to route_to("complaints#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/complaints/1").to route_to("complaints#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/complaints/1").to route_to("complaints#destroy", :id => "1")
    end
  end
end
