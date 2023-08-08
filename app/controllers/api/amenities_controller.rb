# frozen_string_literal: true

module Api
  class AmenitiesController < ApplicationController
    before_action :set_building
    before_action :set_amenity, only: %i[show update destroy]

    # GET /amenities
    def index
      @amenities = @building.amenities.page(params[:page]).per(params[:per_page])

      render json: @amenities, meta: pagination(@amenities)
    end

    # GET /amenities/1
    def show
      render json: @amenity
    end

    # POST /amenities
    def create
      @amenity = Amenity.new(amenity_params)

      if @amenity.save
        render json: @amenity, status: :created, location: @amenity
      else
        render json: @amenityerrors.full_messages, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /amenities/1
    def update
      if @amenity.update(amenity_params)
        render json: @amenity
      else
        render json: @amenityerrors.full_messages, status: :unprocessable_entity
      end
    end

    # DELETE /amenities/1
    def destroy
      @amenity.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_amenity
      @amenity = @building.amenities.where(id: params[:id]).first
    end

    def set_building
      @building = Building.find(params[:building_id])
    end

    # Only allow a list of trusted parameters through.
    def amenity_params
      params.require(:amenity).permit(:name, :open_time, :close_time, :is_paid, :only_for, :fee, :sector_id,
                                      :terms_and_conditions)
    end
  end
end
