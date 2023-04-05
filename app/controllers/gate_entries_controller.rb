class GateEntriesController < ApplicationController
  before_action :set_gate_entry, only: %i[ show update destroy ]

  # GET /gate_entries
  def index
    @gate_entries = GateEntry.all

    render json: @gate_entries
  end

  # GET /gate_entries/1
  def show
    render json: @gate_entry
  end

  # POST /gate_entries
  def create
    @gate_entry = GateEntry.new(gate_entry_params)

    if @gate_entry.save
      render json: @gate_entry, status: :created, location: @gate_entry
    else
      render json: @gate_entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gate_entries/1
  def update
    if @gate_entry.update(gate_entry_params)
      render json: @gate_entry
    else
      render json: @gate_entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gate_entries/1
  def destroy
    @gate_entry.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gate_entry
      @gate_entry = GateEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gate_entry_params
      params.require(:gate_entry).permit(:type, :status, :flat_id, :vehicle_number, :first_name, :last_name, :gender, :contact, :vehicale_image_url, :person_image_url)
    end
end
