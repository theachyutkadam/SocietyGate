# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::VehiclesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/vehicles").to route_to("api/vehicles#index")
    end

    it "routes to #show" do
      expect(get: "/api/vehicles/1").to route_to("api/vehicles#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/vehicles").to route_to("api/vehicles#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/vehicles/1").to route_to("api/vehicles#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/vehicles/1").to route_to("api/vehicles#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/vehicles/1").to route_to("api/vehicles#destroy", id: "1")
    end
  end
end
