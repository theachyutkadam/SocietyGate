# frozen_string_literal: true

module Api
  class ComplaintsController < ApplicationController
    before_action :set_complaint, only: %i[show update destroy]

    # GET /complaints
    def index
      @complaints = Complaint.page(params[:page]).per(params[:per_page])

      render json: @complaints
    end

    # GET /complaints/1
    def show
      render json: @complaint
    end

    # POST /complaints
    def create
      @complaint = Complaint.new(complaint_params)

      if @complaint.save
        render json: @complaint, status: :created, location: @complaint
      else
        render json: @complaint.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /complaints/1
    def update
      if @complaint.update(complaint_params)
        render json: @complaint
      else
        render json: @complaint.errors, status: :unprocessable_entity
      end
    end

    # DELETE /complaints/1
    def destroy
      @complaint.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_complaint
      @complaint = Complaint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def complaint_params
      params.require(:complaint).permit(:title, :complaint_type, :user_id, :description, :sector_id, :flat_id)
    end
  end
end
