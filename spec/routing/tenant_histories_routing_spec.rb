# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::TenantHistoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/tenant_histories").to route_to("api/tenant_histories#index")
    end

    it "routes to #show" do
      expect(get: "/api/tenant_histories/1").to route_to("api/tenant_histories#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/tenant_histories").to route_to("api/tenant_histories#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/tenant_histories/1").to route_to("api/tenant_histories#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/tenant_histories/1").to route_to("api/tenant_histories#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/tenant_histories/1").to route_to("api/tenant_histories#destroy", id: "1")
    end
  end
end
