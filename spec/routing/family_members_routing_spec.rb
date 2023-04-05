# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::FamilyMembersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/family_members").to route_to("api/family_members#index")
    end

    it "routes to #show" do
      expect(get: "/api/family_members/1").to route_to("api/family_members#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/family_members").to route_to("api/family_members#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/family_members/1").to route_to("api/family_members#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/family_members/1").to route_to("api/family_members#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/family_members/1").to route_to("api/family_members#destroy", id: "1")
    end
  end
end
