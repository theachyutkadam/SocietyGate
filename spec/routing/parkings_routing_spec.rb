# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::ParkingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/parkings").to route_to("api/parkings#index")
    end

    it "routes to #show" do
      expect(get: "/api/parkings/1").to route_to("api/parkings#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/parkings").to route_to("api/parkings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/parkings/1").to route_to("api/parkings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/parkings/1").to route_to("api/parkings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/parkings/1").to route_to("api/parkings#destroy", id: "1")
    end
  end
end
