# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::FloorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/floors").to route_to("api/floors#index")
    end

    it "routes to #show" do
      expect(get: "/api/floors/1").to route_to("api/floors#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/floors").to route_to("api/floors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/floors/1").to route_to("api/floors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/floors/1").to route_to("api/floors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/floors/1").to route_to("api/floors#destroy", id: "1")
    end
  end
end
