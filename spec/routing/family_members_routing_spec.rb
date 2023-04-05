require "rails_helper"

RSpec.describe FamilyMembersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/family_members").to route_to("family_members#index")
    end

    it "routes to #show" do
      expect(:get => "/family_members/1").to route_to("family_members#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/family_members").to route_to("family_members#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/family_members/1").to route_to("family_members#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/family_members/1").to route_to("family_members#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/family_members/1").to route_to("family_members#destroy", :id => "1")
    end
  end
end
