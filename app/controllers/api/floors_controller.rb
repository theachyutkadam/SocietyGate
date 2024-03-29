# frozen_string_literal: true

module Api
  class FloorsController < ApplicationController
    before_action :set_wing
    before_action :set_floor, only: %i[show update destroy]

    # GET /floors
    def index
      @floors = @wing.floors.order("created_at asc").page(params[:page]).per(params[:per_page])
      render json: @floors, meta: pagination(@floors)
    end

    # GET /floors/1
    def show
      render json: @floor
    end

    # POST /floors
    def create
      @floor = Floor.new(floor_params)

      if @floor.save
        render json: @floor, status: :created, location: @floor
      else
        render json: @floor.errors.full_messages, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /floors/1
    def update
      if @floor.update(floor_params)
        render json: @floor
      else
        render json: @floor.errors.full_messages, status: :unprocessable_entity
      end
    end

    # DELETE /floors/1
    def destroy
      @floor.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_floor
      @floor = @wing.floors.find(params[:id])
    end

    def set_wing
      @wing = Wing.find(params[:wing_id])
    end

    # Only allow a list of trusted parameters through.
    def floor_params
      params.require(:floor).permit(:number, :number_of_flats, :is_refuge_area, :wing_id, :fire_exebution, :service_at)
    end
  end
end
