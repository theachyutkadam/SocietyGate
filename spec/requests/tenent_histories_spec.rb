# frozen_string_literal: true

require "rails_helper"

RSpec.describe "TenentHistories", type: :request do
  describe "GET /tenent_histories" do
    it "works! (now write some real specs)" do
      get tenent_histories_path
      expect(response).to have_http_status(200)
    end
  end
end
