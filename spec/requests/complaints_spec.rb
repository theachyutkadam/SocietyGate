require 'rails_helper'

RSpec.describe "Complaints", type: :request do
  describe "GET /complaints" do
    it "works! (now write some real specs)" do
      get complaints_path
      expect(response).to have_http_status(200)
    end
  end
end
