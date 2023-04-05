# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::UserInformationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/user_informations").to route_to("api/user_informations#index")
    end

    it "routes to #show" do
      expect(get: "/api/user_informations/1").to route_to("api/user_informations#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/user_informations").to route_to("api/user_informations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/user_informations/1").to route_to("api/user_informations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/user_informations/1").to route_to("api/user_informations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/user_informations/1").to route_to("api/user_informations#destroy", id: "1")
    end
  end
end
