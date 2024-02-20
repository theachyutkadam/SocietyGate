# frozen_string_literal: true

module Api
  class FlatsController < ApplicationController
    before_action :set_floor, only: %i[index]
    before_action :set_flat, only: %i[show update destroy]

    # GET /flats
    def index
      if @floor
        @flats = @floor.flats.includes(:owner, :tenant).order("number asc").page(params[:page]).per(params[:per_page])
      else
        @flats = Flat.includes(:floor, :owner,
                               :tenant).page(params[:page]).per(params[:per_page]).order("#{params[:column]} #{params[:order_by]}")
      end
      render json: @flats, meta: pagination(@flats)
    end

    # GET /flats/1
    def show
      render json: @flat
    end

    # POST /flats
    def create
      @flat = Flat.new(flat_params)

      if @flat.save
        render json: @flat, status: :created, location: @flat
      else
        render json: @flat.errors.full_messages, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /flats/1
    def update
      if @flat.update(flat_params)
        render json: @flat, meta: { status: 200 }
      else
        render json: @flat.errors.full_messages, status: :unprocessable_entity
      end
    end

    # DELETE /flats/1
    def destroy
      @flat.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_flat
      @flat = Flat.find(params[:id])
    end

    def set_floor
      @floor = Floor.find(params[:floor_id]) if params[:floor_id]
    end

    # Only allow a list of trusted parameters through.
    def flat_params
      params.require(:flat).permit(:number, :owner_id, :floor_id, :area_in_feet, :is_rented, :tenant_id, :structure,
                                   :letter_box_number, :electricity_meter_number, :gas_meter_number)
    end

    # Following are Operations methods TODO:
  end
end
