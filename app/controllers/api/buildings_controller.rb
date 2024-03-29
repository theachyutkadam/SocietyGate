# frozen_string_literal: true

module Api
  class BuildingsController < ApplicationController
    before_action :set_building, only: %i[show update destroy]

    # GET /buildings
    def index
      @buildings = Building.page(params[:page]).per(params[:per_page]).order("#{params[:column]} #{params[:order_by]}")

      render json: @buildings, meta: pagination(@buildings)
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
        render json: @building.errors.full_messages, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /buildings/1
    def update
      if @building.update(building_params)
        render json: @building, meta: { status: 200 }
      else
        render json: @building.errors.full_messages, status: :unprocessable_entity
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
