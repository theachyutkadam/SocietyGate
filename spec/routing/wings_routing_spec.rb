require "rails_helper"

RSpec.describe WingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/wings").to route_to("wings#index")
    end

    it "routes to #show" do
      expect(:get => "/wings/1").to route_to("wings#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/wings").to route_to("wings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/wings/1").to route_to("wings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/wings/1").to route_to("wings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/wings/1").to route_to("wings#destroy", :id => "1")
    end
  end
end
