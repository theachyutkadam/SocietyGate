# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    skip_before_action :authenticate_user!, only: %i[login create]
    before_action :set_user, only: %i[show update destroy]

    # GET /users
    def index
      @users = User.includes(:society).page(params[:page]).per(params[:per_page])

      render json: @users, meta: pagination(@users)
    end

    # GET /users/1
    def show
      render json: @user
    end

    # POST /users
    def create
      @user = User.new(user_params)

      if @user.save
        render json: @user, status: :created, location: @user
      else
        render json: @user.errors.full_messages, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors.full_messages, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
      @user.destroy
    end

    def login
      @user = User.find_by(email: params[:email])

      return render json: { errors: "User does not found", status: 400 } unless @user
      return render json: { errors: "User has been #{@user.status}", status: 400 } unless @user.active?

      if @user.password == params[:password]
        # return render json: { user_information_id: @user.user_information.id, auth_token: @user.token, status: 200 } if @user.token
        token = @user.generate_token
        @user.update(token: token)
        # ahoy.authenticate(@user)
        render json: {
          user_information_id: @user.user_information.id,
          auth_token: token,
          user_id: @user.id,
          user_details: {full_name: @user.user_information.full_name},
          status: 200,
        }
      else
        render json: { errors: "Invalid credentials", status: 400 }
      end
    end

    def logout
      user = User.find(current_user.id)
      user.update(token: '')
      if user.token.empty?
        render json: { auth_token: nil, status: 200 }
      else
        render json: { errors: "Something went wrong" }, status: :unauthorized
      end
    end

    def onboarding
      @society_details = []

      Building.page(params[:page]).per(params[:per_page]).each do |building|
        @wings_details = []

        building.wings.each do |wing|
          collect_wing_details(wing, building)
        end
      end
      render json: { society_details: @society_details }
    end

    def collect_wing_details(wing, building)
      @floor_details = []

      wing.floors.each do |floor|
        collect_floor_details(floor, wing, building)
      end
    end

    def collect_floor_details(floor, wing, building)
      flat_numbers = []
      flat_numbers = floor.flats.pluck(:number)
      @floor_details.append(
        {
          "id": floor.id,
          "fire_exebution": floor.fire_exebution,
          "is_refuge_area": floor.is_refuge_area,
          "number": floor.number,
          "flats_details": flat_numbers,
        },
      )
      @wings_details.append(
        {
          "id": wing.id,
          "name": wing.name,
          "floor_details": @floor_details,
        },
      )
      @society_details.append(
        { "buildings_details":
          {
            "id": building.id,
            "name": building.name,
            "wings_details": @wings_details,
          } },
      )
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:password, :email, :status, :is_admin, :token, :society_id, :user_type,
                                   :is_primary_user)
    end
  end
end
