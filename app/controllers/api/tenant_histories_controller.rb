# frozen_string_literal: true

module Api
  class TenantHistoriesController < ApplicationController
    before_action :set_tenant_history, only: %i[show update destroy]

    # GET /tenant_histories
    def index
      @tenant_histories = TenantHistory.includes(:tenant, :flat).page(params[:page]).per(params[:per_page])

      render json: @tenant_histories, meta: pagination(@tenant_histories)
    end

    # GET /tenant_histories/1
    def show
      render json: @tenant_history
    end

    # POST /tenant_histories
    def create
      @tenant_history = TenantHistory.new(tenant_history_params)

      if @tenant_history.save
        render json: @tenant_history, status: :created, location: @tenant_history
      else
        render json: @tenant_history.errors.full_messages, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /tenant_histories/1
    def update
      if @tenant_history.update(tenant_history_params)
        render json: @tenant_history
      else
        render json: @tenant_history.errors.full_messages, status: :unprocessable_entity
      end
    end

    # DELETE /tenant_histories/1
    def destroy
      @tenant_history.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_tenant_history
      @tenant_history = TenantHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tenant_history_params
      params.require(:tenant_history).permit(:tenant_id, :flat_id, :move_in_at, :move_out_at)
    end
  end
end
