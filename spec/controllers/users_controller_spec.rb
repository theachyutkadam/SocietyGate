# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::UsersController, type: :controller do
  let(:society) { create(:society) }
  let(:user) { create(:user, society: society, password: "password123", status: "active") }

  let(:valid_attributes) do
    {
      email: Faker::Internet.email,
      password: "password123",
      society_id: society.id,
      status: "active",
      is_admin: false,
      user_type: "owner",
      is_primary_user: true
    }
  end

  let(:invalid_attributes) do
    {
      email: nil,
      password: nil
    }
  end

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  def json
    JSON.parse(response.body)
  end

  describe "GET #index" do
    before { create_list(:user, 3, society: society) }

    it "returns success status" do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it "returns users list" do
      get :index
      expect(json).not_to be_empty
    end
  end

  describe "GET #show" do
    it "returns success status" do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:ok)
    end

    it "returns correct user" do
      get :show, params: { id: user.id }

      expect(json["user"]["id"]).to eq(user.id)
      expect(json["user"]["email"]).to eq(user.email)
    end
  end

  describe "POST #create" do
    before do
      allow(controller).to receive(:authenticate_user!).and_return(false)
    end

    context "with valid params" do
      it "creates a user" do
        expect {
          post :create, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it "returns created status" do
        post :create, params: { user: valid_attributes }

        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      it "returns error status" do
        post :create, params: { user: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT #update" do
    let(:new_attributes) do
      { email: "updated@example.com" }
    end

    context "with valid params" do
      it "updates the user" do
        put :update, params: { id: user.id, user: new_attributes }

        user.reload
        expect(user.email).to eq("updated@example.com")
      end

      it "returns success status" do
        put :update, params: { id: user.id, user: new_attributes }

        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do
      it "returns error status" do
        put :update, params: { id: user.id, user: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the user" do
      user_to_delete = create(:user, society: society)

      expect {
        delete :destroy, params: { id: user_to_delete.id }
      }.to change(User, :count).by(-1)
    end
  end

  describe "POST #login" do
    before do
      create(:user_information, user: user)
    end

    context "with correct credentials" do
      it "returns auth token" do
        post :login, params: { email: user.email, password: "password123" }

        expect(response).to have_http_status(:ok)
        expect(json["auth_token"]).not_to be_nil
      end
    end

    context "with wrong password" do
      it "returns error" do
        post :login, params: { email: user.email, password: "wrong" }

        expect(json["errors"]).to eq("Invalid credentials")
      end
    end

    context "when user does not exist" do
      it "returns error" do
        post :login, params: { email: "fake@test.com", password: "123" }

        expect(json["errors"]).to eq("User does not found")
      end
    end
  end

  describe "POST #logout" do
    it "clears token" do
      user.update(token: "abc123")

      post :logout

      user.reload
      expect(user.token).to eq("")
      expect(json["auth_token"]).to be_nil
    end
  end

  describe "GET #onboarding" do
    before do
      building = create(:building, society: society)
      wing = create(:wing, building: building)
      floor = create(:floor, wing: wing)
      create(:flat, floor: floor)
    end

    it "returns society structure" do
      get :onboarding

      expect(response).to have_http_status(:ok)
      expect(json["society_details"]).not_to be_nil
    end
  end
end
