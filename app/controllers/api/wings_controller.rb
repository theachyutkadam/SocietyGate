# frozen_string_literal: true

module Api
  class WingsController < ApplicationController
    before_action :set_building
    before_action :set_wing, only: %i[show update destroy]

    # GET /wings
    def index
      @wings = @building.wings.page(params[:page]).per(params[:per_page])
      # @wings = Wing.includes(:building).page(params[:page]).per(params[:per_page])

      render json: @wings
    end

    # GET /wings/1
    def show
      render json: @wing
    end

    # POST /wings
    def create
      @wing = @building.wings.new(wing_params)

      if @wing.save
        render json: @wing, status: :created, location: @wing
      else
        render json: @wing.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /wings/1
    def update
      if @wing.update(wing_params)
        render json: @wing
      else
        render json: @wing.errors, status: :unprocessable_entity
      end
    end

    # DELETE /wings/1
    def destroy
      @wing.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_wing
      @wing = @building.wings.find(params[:id])
    end

    def set_building
      @building = Building.find(params[:building_id])
    end

    # Only allow a list of trusted parameters through.
    def wing_params
      params.require(:wing).permit(:name, :building_id, :number_of_lifts, :structure)
    end
  end
end
