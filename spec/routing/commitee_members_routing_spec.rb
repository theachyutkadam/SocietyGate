# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::CommiteeMembersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/commitee_members").to route_to("api/commitee_members#index")
    end

    it "routes to #show" do
      expect(get: "/api/commitee_members/1").to route_to("api/commitee_members#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/commitee_members").to route_to("api/commitee_members#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/commitee_members/1").to route_to("api/commitee_members#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/commitee_members/1").to route_to("api/commitee_members#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/commitee_members/1").to route_to("api/commitee_members#destroy", id: "1")
    end
  end
end
