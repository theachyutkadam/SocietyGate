# frozen_string_literal: true

module Api
  class ParkingsController < ApplicationController
    before_action :set_parking, only: %i[show update destroy]

    # GET /parkings
    def index
      @parkings = Parking.page(params[:page]).per(params[:per_page])

      render json: @parkings
    end

    # GET /parkings/1
    def show
      render json: @parking
    end

    # POST /parkings
    def create
      @parking = Parking.new(parking_params)

      if @parking.save
        render json: @parking, status: :created, location: @parking
      else
        render json: @parkingerrors.full_messages, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /parkings/1
    def update
      if @parking.update(parking_params)
        render json: @parking
      else
        render json: @parkingerrors.full_messages, status: :unprocessable_entity
      end
    end

    # DELETE /parkings/1
    def destroy
      @parking.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_parking
      @parking = Parking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parking_params
      params.require(:parking).permit(:number, :is_covered, :size_in_feet, :sector_id, :owner_id, :flat_id)
    end
  end
end
