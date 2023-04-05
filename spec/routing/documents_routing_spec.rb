# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::DocumentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/documents").to route_to("api/documents#index")
    end

    it "routes to #show" do
      expect(get: "/api/documents/1").to route_to("api/documents#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/documents").to route_to("api/documents#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/documents/1").to route_to("api/documents#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/documents/1").to route_to("api/documents#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/documents/1").to route_to("api/documents#destroy", id: "1")
    end
  end
end
