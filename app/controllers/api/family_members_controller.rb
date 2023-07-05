# frozen_string_literal: true

module Api
  class FamilyMembersController < ApplicationController
    before_action :set_family_member, only: %i[show update destroy]

    # GET /family_members
    def index
      @family_members = FamilyMember.page(params[:page]).per(params[:per_page])

      render json: @family_members
    end

    # GET /family_members/1
    def show
      render json: @family_member
    end

    # POST /family_members
    def create
      @family_member = FamilyMember.new(family_member_params)

      if @family_member.save
        render json: @family_member, status: :created, location: @family_member
      else
        render json: @family_member.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /family_members/1
    def update
      if @family_member.update(family_member_params)
        render json: @family_member
      else
        render json: @family_member.errors, status: :unprocessable_entity
      end
    end

    # DELETE /family_members/1
    def destroy
      @family_member.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_family_member
      @family_member = FamilyMember.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def family_member_params
      params.require(:family_member).permit(:first_name, :last_name, :contact, :birth_date, :gender, :flat_id,
                                            :pan_card_number, :adhaar_card_number, :avatar_url, :maritial_status, :status, :relation_with)
    end
  end
end
