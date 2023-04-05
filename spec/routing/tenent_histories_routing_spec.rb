# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::TenentHistoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/tenent_histories").to route_to("api/tenent_histories#index")
    end

    it "routes to #show" do
      expect(get: "/api/tenent_histories/1").to route_to("api/tenent_histories#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/tenent_histories").to route_to("api/tenent_histories#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/tenent_histories/1").to route_to("api/tenent_histories#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/tenent_histories/1").to route_to("api/tenent_histories#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/tenent_histories/1").to route_to("api/tenent_histories#destroy", id: "1")
    end
  end
end
