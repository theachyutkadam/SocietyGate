# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::SocietiesController, type: :controller do
  let!(:society) { create(:society) }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
  end

  let(:valid_attributes) do
    {
      name: "Green Valley Society",
      city: "Pune",
      state: "Maharashtra",
      location: "Wakad",
      registration_number: "REG12345",
      contact: "9876543210",
      email: "society@test.com",
      address: "Main road, Pune"
    }
  end

  let(:invalid_attributes) do
    {
      name: nil,
      email: nil
    }
  end

  def json
    JSON.parse(response.body)
  end

  describe "GET #index" do
    before do
      create_list(:society, 3)
      get :index
    end

    it "returns success status" do
      expect(response).to have_http_status(:ok)
    end

    it "returns societies list" do
      expect(json).not_to be_empty
    end
  end

  describe "GET #show" do
    before { get :show, params: { id: society.id } }

    it "returns success" do
      expect(response).to have_http_status(:ok)
    end

    it "returns correct society" do
      # expect(json["id"]).to eq(society.id)
      expect(json["society"]["id"]).to eq(society.id)

    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a society" do
        expect {
          post :create, params: { society: valid_attributes }
        }.to change(Society, :count).by(1)
      end

      it "returns created status" do
        post :create, params: { society: valid_attributes }

        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      before do
        post :create, params: { society: invalid_attributes }
      end

      it "returns unprocessable entity status" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      before do
        put :update, params: {
          id: society.id,
          society: { name: "Updated Society Name" }
        }
      end

      it "updates the society" do
        society.reload
        expect(society.name).to eq("Updated Society Name")
      end

      it "returns success status" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do
      before do
        put :update, params: {
          id: society.id,
          society: { name: nil }
        }
      end

      it "returns error status" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the society" do
      society_to_delete = create(:society)

      expect {
        delete :destroy, params: { id: society_to_delete.id }
      }.to change(Society, :count).by(-1)
    end
  end
end
