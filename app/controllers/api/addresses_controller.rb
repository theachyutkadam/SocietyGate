# frozen_string_literal: true

module Api
  class AddressesController < ApplicationController
    before_action :set_address, only: %i[show update destroy]

    # GET /addresses
    def index
      @addresses = Address.page(params[:page]).per(params[:per_page])

      render json: @addresses, meta: pagination(@addresses)
    end

    # GET /addresses/1
    def show
      render json: @address
    end

    # POST /addresses
    def create
      @address = Address.new(address_params)

      if @address.save
        render json: @address, status: :created, location: @address
      else
        render json: @address.errors.full_messages.full_messages, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /addresses/1
    def update
      if @address.update(address_params)
        render json: @address
      else
        render json: @address.errors.full_messages.full_messages, status: :unprocessable_entity
      end
    end

    # DELETE /addresses/1
    def destroy
      @address.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(
        :building,
        :city,
        :flat_number,
        :pin_code,
        :state,
        :street_name,
        :user_id,
      )
    end
  end
end
