# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::SocietiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/societies").to route_to("api/societies#index")
    end

    it "routes to #show" do
      expect(get: "/api/societies/1").to route_to("api/societies#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/societies").to route_to("api/societies#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/societies/1").to route_to("api/societies#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/societies/1").to route_to("api/societies#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/societies/1").to route_to("api/societies#destroy", id: "1")
    end
  end
end
