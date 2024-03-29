# frozen_string_literal: true

module Api
  class EventsController < ApplicationController
    before_action :set_event, only: %i[show update destroy]

    # GET /events
    def index
      @events = Event.page(params[:page]).per(params[:per_page])

      render json: @events, meta: pagination(@events)
    end

    # GET /events/1
    def show
      render json: @event
    end

    # POST /events
    def create
      @event = Event.new(event_params)

      if @event.save
        render json: @event, status: :created, location: @event
      else
        render json: @event.errors.full_messages, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /events/1
    def update
      if @event.update(event_params)
        render json: @event
      else
        render json: @event.errors.full_messages, status: :unprocessable_entity
      end
    end

    # DELETE /events/1
    def destroy
      @event.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :sector_id, :start_at, :end_at, :is_private, :flat_id)
    end
  end
end
