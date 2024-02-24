class VenuesController < ApplicationController
  before_action :set_venue, only: %i[ show update destroy ]

  # GET /venues
  def index
    venues = Venue.all

    render json: venues.as_json(include: { facility: { only: :name }, venue_type: { only: :name } })
  end

  # GET /venues/1
  def show
    render json: @venue
  end

  # POST /venues
  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      render json: @venue, status: :created, location: @venue
    else
      render json: @venue.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /venues/1
  def update
    if @venue.update(venue_params)
      render json: @venue
    else
      render json: @venue.errors, status: :unprocessable_entity
    end
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name, :facility_id)
  end
end
