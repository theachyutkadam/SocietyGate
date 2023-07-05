# frozen_string_literal: true

module Api
  class CommiteeMembersController < ApplicationController
    before_action :set_commitee_member, only: %i[show update destroy]

    # GET /commitee_members
    def index
      @commitee_members = CommiteeMember.page(params[:page]).per(params[:per_page])

      render json: @commitee_members
    end

    # GET /commitee_members/1
    def show
      render json: @commitee_member
    end

    # POST /commitee_members
    def create
      @commitee_member = CommiteeMember.new(commitee_member_params)

      if @commitee_member.save
        render json: @commitee_member, status: :created, location: @commitee_member
      else
        render json: @commitee_member.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /commitee_members/1
    def update
      if @commitee_member.update(commitee_member_params)
        render json: @commitee_member
      else
        render json: @commitee_member.errors, status: :unprocessable_entity
      end
    end

    # DELETE /commitee_members/1
    def destroy
      @commitee_member.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_commitee_member
      @commitee_member = CommiteeMember.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def commitee_member_params
      params.require(:commitee_member).permit(:name, :user_id, :members_count, :commity_id, :designation)
    end
  end
end
