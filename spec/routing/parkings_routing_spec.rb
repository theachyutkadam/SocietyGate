require "rails_helper"

RSpec.describe ParkingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/parkings").to route_to("parkings#index")
    end

    it "routes to #show" do
      expect(:get => "/parkings/1").to route_to("parkings#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/parkings").to route_to("parkings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/parkings/1").to route_to("parkings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/parkings/1").to route_to("parkings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/parkings/1").to route_to("parkings#destroy", :id => "1")
    end
  end
end
