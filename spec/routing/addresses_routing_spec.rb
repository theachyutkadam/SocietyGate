# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::AddressesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/addresses").to route_to("api/addresses#index")
    end

    it "routes to #show" do
      expect(get: "/api/addresses/1").to route_to("api/addresses#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/addresses").to route_to("api/addresses#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/addresses/1").to route_to("api/addresses#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/addresses/1").to route_to("api/addresses#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/addresses/1").to route_to("api/addresses#destroy", id: "1")
    end
  end
end
