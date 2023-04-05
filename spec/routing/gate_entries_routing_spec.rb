# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::GateEntriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/gate_entries").to route_to("api/gate_entries#index")
    end

    it "routes to #show" do
      expect(get: "/api/gate_entries/1").to route_to("api/gate_entries#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/gate_entries").to route_to("api/gate_entries#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/gate_entries/1").to route_to("api/gate_entries#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/gate_entries/1").to route_to("api/gate_entries#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/gate_entries/1").to route_to("api/gate_entries#destroy", id: "1")
    end
  end
end
