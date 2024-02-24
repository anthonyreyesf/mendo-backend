class VenueTypesController < ApplicationController
  before_action :set_venue_type, only: %i[ show update destroy ]

  # GET /venue_types
  def index
    venue_types = VenueType.all

    render json: venue_types
  end

  # GET /venue_types/1
  def show
    render json: @venue_type
  end

  # POST /venue_types
  def create
    @venue_type = VenueType.new(venue_params)

    if @venue_type.save
      render json: @venue_type, status: :created, location: @venue_type
    else
      render json: @venue_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /venue_types/1
  def update
    if @venue_type.update(venue_params)
      render json: @venue_type
    else
      render json: @venue_type.errors, status: :unprocessable_entity
    end
  end

  private

  def set_venue_type
    @venue_type = VenueType.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name)
  end
end
