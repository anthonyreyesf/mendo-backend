class FacilitiesController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # GET /facilities
  def index
    @facilities = Facility.all

    render json: @facilities
  end

  # GET /facilities/1
  def show
    render json: @facility
  end

  # POST /facilities
  def create
    @facility = Facility.new(user_params)

    if @facility.save
      render json: @facility, status: :created, location: @facility
    else
      render json: @facility.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /facilities/1
  def update
    if @facility.update(user_params)
      render json: @facility
    else
      render json: @facility.errors, status: :unprocessable_entity
    end
  end

  # DELETE /facilities/1
  def destroy
    @facility.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @facility = Facility.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:facility).permit(:account_id, :first_name, :last_name, :email)
    end
end
