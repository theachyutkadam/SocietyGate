# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::CommitiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/commities").to route_to("api/commities#index")
    end

    it "routes to #show" do
      expect(get: "/api/commities/1").to route_to("api/commities#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/commities").to route_to("api/commities#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/commities/1").to route_to("api/commities#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/commities/1").to route_to("api/commities#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/commities/1").to route_to("api/commities#destroy", id: "1")
    end
  end
end
