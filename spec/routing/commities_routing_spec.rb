require "rails_helper"

RSpec.describe CommitiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/commities").to route_to("commities#index")
    end

    it "routes to #show" do
      expect(:get => "/commities/1").to route_to("commities#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/commities").to route_to("commities#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/commities/1").to route_to("commities#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/commities/1").to route_to("commities#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/commities/1").to route_to("commities#destroy", :id => "1")
    end
  end
end
