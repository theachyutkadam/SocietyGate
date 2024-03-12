# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserInformation, type: :request do
  let(:society) { create(:society) }
  let(:user) { create(:user, society:) }
  # let(:user_information) { create(:user_information, user: user) }

  describe "GET #index" do
    let!(:user_informations) { FactoryBot.create_list(:user_information, 1, user:) }
    before { get "/api/user_informations", headers: { Authorization: user.token } }
    it "returns all user_informations" do
      expect(JSON.parse(response.body)["user_informations"].count).to eq(1)
    end
    it "returns status code 200" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:user_information) { build(:user_information, user:) }
    context "when request attributes are valid" do
      it "returns status code 201" do
        # user_information.avatar.attach(
        #   io: File.open(Dir.glob(File.join(Rails.root, '/public/avatar/', '*')).sample),
        #   filename: "#{user_information.id}.jpg"
        # )
        # p "+++++++++++++++++"
        # p user_information.attributes
        # p "+++++++++++++++++"
        # post "/api/user_informations", params: user_information.attributes, headers: { Authorization: user.token }
        # expect(response).to have_http_status(201)
      end
    end
  end

  describe "GET #show" do
    before { get "/api/user_informations/#{user_information.id}", headers: { Authorization: user.token } }
    let(:user_information) { create(:user_information, user:) }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    before { delete "/api/user_informations/#{user_information.id}", headers: { Authorization: user.token } }
    let(:user_information) { create(:user_information, user:) }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
