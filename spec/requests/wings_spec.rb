require 'rails_helper'

RSpec.describe "Wings", type: :request do
  describe "GET /wings" do
    it "works! (now write some real specs)" do
      get wings_path
      expect(response).to have_http_status(200)
    end
  end
end
