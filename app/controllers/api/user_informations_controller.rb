# frozen_string_literal: true

module Api
  class UserInformationsController < ApplicationController
    before_action :set_user_information, only: %i[show update destroy]

    # GET /user_informations
    def index
      @user_informations = UserInformation.includes(:user).page params[:page]

      render json: @user_informations
    end

    # GET /user_informations/1
    def show
      render json: @user_information
    end

    # POST /user_informations
    def create
      @user_information = UserInformation.new(user_information_params)

      if @user_information.save
        render json: @user_information, status: :created, location: @user_information
      else
        render json: @user_information.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /user_informations/1
    def update
      if @user_information.update(user_information_params)
        render json: @user_information
      else
        render json: @user_information.errors, status: :unprocessable_entity
      end
    end

    # DELETE /user_informations/1
    def destroy
      @user_information.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_user_information
      @user_information = UserInformation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_information_params
      params.require(:user_information).permit(:first_name, :middle_name, :last_name, :contact, :gender, :birth_date,
                                               :pan_card_number, :adhaar_card_number, :is_handicap, :handicap_details,
                                               :maritial_status, :user_id, :avatar)
    end
  end
end
