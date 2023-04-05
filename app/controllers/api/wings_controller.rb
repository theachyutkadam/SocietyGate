# frozen_string_literal: true

class WingsController < ApplicationController
  before_action :set_wing, only: %i[show update destroy]

  # GET /wings
  def index
    @wings = Wing.all

    render json: @wings
  end

  # GET /wings/1
  def show
    render json: @wing
  end

  # POST /wings
  def create
    @wing = Wing.new(wing_params)

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
    @wing = Wing.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def wing_params
    params.require(:wing).permit(:name, :sector_id, :number_of_lifts, :structure)
  end
end
