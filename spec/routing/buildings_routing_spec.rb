# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::BuildingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/buildings").to route_to("api/buildings#index")
    end

    it "routes to #show" do
      expect(get: "/api/buildings/1").to route_to("api/buildings#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/buildings").to route_to("api/buildings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/buildings/1").to route_to("api/buildings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/buildings/1").to route_to("api/buildings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/buildings/1").to route_to("api/buildings#destroy", id: "1")
    end
  end
end
