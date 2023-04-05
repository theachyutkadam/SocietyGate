require 'rails_helper'

RSpec.describe "Parkings", type: :request do
  describe "GET /parkings" do
    it "works! (now write some real specs)" do
      get parkings_path
      expect(response).to have_http_status(200)
    end
  end
end
