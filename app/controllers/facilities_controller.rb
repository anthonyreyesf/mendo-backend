class FacilitiesController < ApplicationController
  before_action :set_facility, only: %i[ show update destroy ]

  # GET /facilities
  def index
    facilities = Facility.all

    render json: facilities.as_json(include: { operation_hours: { only: [:opens_at, :closes_at, :id] } })
  end

  # GET /facilities/1
  def show
    render json: @facility
  end

  # POST /facilities
  def create
    @facility = Facility.new(params)

    if @facility.save
      render json: @facility, status: :created, location: facility
    else
      render json: @facility.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /facilities/1
  def update
    if @facility.update(facility_params)
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
  def set_facility
    @facility = Facility.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def facility_params
    params.require(:facility).permit(:name, :address, :country, :city, :province, :postal_code, :phone_number, :description, :status)
  end
end
