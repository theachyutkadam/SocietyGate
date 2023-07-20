# frozen_string_literal: true

module Api
  class BuildingsController < ApplicationController
    before_action :set_building, only: %i[show update destroy]

    # GET /buildings
    def index
      @buildings = Building.page(params[:page]).per(params[:per_page])

      render json: { buildings: @buildings, total_count: @buildings.total_count, total_pages: @buildings.total_pages }
    end

    # GET /buildings/1
    def show
      render json: @building
    end

    # POST /buildings
    def create
      @building = Building.new(building_params)

      if @building.save
        render json: @building, status: :created, location: @building
      else
        render json: @building.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /buildings/1
    def update
      puts "++++++++++++++++++++++"
      puts building_params
      if @building.update(building_params)
        render json: @building
      else
        render json: @building.errors, status: :unprocessable_entity
      end
    end

    # DELETE /buildings/1
    def destroy
      @building.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = Building.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def building_params
      params.require(:building).permit(:society_id, :name, :location, :status)
    end
  end
end
