require "rails_helper"

RSpec.describe GateEntriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/gate_entries").to route_to("gate_entries#index")
    end

    it "routes to #show" do
      expect(:get => "/gate_entries/1").to route_to("gate_entries#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/gate_entries").to route_to("gate_entries#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/gate_entries/1").to route_to("gate_entries#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/gate_entries/1").to route_to("gate_entries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/gate_entries/1").to route_to("gate_entries#destroy", :id => "1")
    end
  end
end
