require 'rails_helper'

RSpec.describe "UserInformations", type: :request do
  describe "GET /user_informations" do
    it "works! (now write some real specs)" do
      get user_informations_path
      expect(response).to have_http_status(200)
    end
  end
end
