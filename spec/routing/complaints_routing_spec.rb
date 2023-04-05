# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::ComplaintsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/complaints").to route_to("api/complaints#index")
    end

    it "routes to #show" do
      expect(get: "/api/complaints/1").to route_to("api/complaints#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/complaints").to route_to("api/complaints#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/complaints/1").to route_to("api/complaints#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/complaints/1").to route_to("api/complaints#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/complaints/1").to route_to("api/complaints#destroy", id: "1")
    end
  end
end
