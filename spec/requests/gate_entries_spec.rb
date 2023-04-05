# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GateEntries", type: :request do
  describe "GET /gate_entries" do
    it "works! (now write some real specs)" do
      get gate_entries_path
      expect(response).to have_http_status(200)
    end
  end
end
