# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::EventsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/events").to route_to("api/events#index")
    end

    it "routes to #show" do
      expect(get: "/api/events/1").to route_to("api/events#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/events").to route_to("api/events#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/events/1").to route_to("api/events#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/events/1").to route_to("api/events#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/events/1").to route_to("api/events#destroy", id: "1")
    end
  end
end
