# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::WingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/wings").to route_to("api/wings#index")
    end

    it "routes to #show" do
      expect(get: "/api/wings/1").to route_to("api/wings#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/wings").to route_to("api/wings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/wings/1").to route_to("api/wings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/wings/1").to route_to("api/wings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/wings/1").to route_to("api/wings#destroy", id: "1")
    end
  end
end
