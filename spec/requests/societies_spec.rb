require 'rails_helper'

RSpec.describe "Societies", type: :request do
  describe "GET /societies" do
    it "works! (now write some real specs)" do
      get societies_path
      expect(response).to have_http_status(200)
    end
  end
end
