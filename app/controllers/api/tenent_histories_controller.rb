# frozen_string_literal: true

class TenentHistoriesController < ApplicationController
  before_action :set_tenent_history, only: %i[show update destroy]

  # GET /tenent_histories
  def index
    @tenent_histories = TenentHistory.all

    render json: @tenent_histories
  end

  # GET /tenent_histories/1
  def show
    render json: @tenent_history
  end

  # POST /tenent_histories
  def create
    @tenent_history = TenentHistory.new(tenent_history_params)

    if @tenent_history.save
      render json: @tenent_history, status: :created, location: @tenent_history
    else
      render json: @tenent_history.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tenent_histories/1
  def update
    if @tenent_history.update(tenent_history_params)
      render json: @tenent_history
    else
      render json: @tenent_history.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tenent_histories/1
  def destroy
    @tenent_history.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tenent_history
    @tenent_history = TenentHistory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tenent_history_params
    params.require(:tenent_history).permit(:tenant_id, :flat_id, :move_in_at, :move_out_at)
  end
end
