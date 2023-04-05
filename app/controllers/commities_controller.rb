class CommitiesController < ApplicationController
  before_action :set_commity, only: %i[ show update destroy ]

  # GET /commities
  def index
    @commities = Commity.all

    render json: @commities
  end

  # GET /commities/1
  def show
    render json: @commity
  end

  # POST /commities
  def create
    @commity = Commity.new(commity_params)

    if @commity.save
      render json: @commity, status: :created, location: @commity
    else
      render json: @commity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /commities/1
  def update
    if @commity.update(commity_params)
      render json: @commity
    else
      render json: @commity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /commities/1
  def destroy
    @commity.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commity
      @commity = Commity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def commity_params
      params.require(:commity).permit(:title, :sector_id, :members_limit)
    end
end
