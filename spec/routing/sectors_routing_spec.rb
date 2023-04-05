# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::SectorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/sectors").to route_to("api/sectors#index")
    end

    it "routes to #show" do
      expect(get: "/api/sectors/1").to route_to("api/sectors#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/sectors").to route_to("api/sectors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/sectors/1").to route_to("api/sectors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/sectors/1").to route_to("api/sectors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/sectors/1").to route_to("api/sectors#destroy", id: "1")
    end
  end
end
