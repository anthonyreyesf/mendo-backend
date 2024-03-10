class VenuesController < ApplicationController
  before_action :set_venue, only: %i[ show update destroy available_slots ]

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

  # GET /venues/1/available_slots?date=2021-01-01&duration=1
  def available_slots
    date = Date.parse(params[:date])
    booking_duration = params[:duration].to_i.hours

    operation_hour = @venue.facility.operation_hours.find_by(day_of_week:date.wday)
    available_slots = find_available_slots(date, operation_hour, booking_duration)

    render json: { available_slots: available_slots }
  end

  private

  def find_available_slots(date, operation_hour, booking_duration)
    return [] unless operation_hour

    start_time = operation_hour.opens_at.to_time
    end_time = operation_hour.closes_at.to_time
    available_slots = []

    while start_time + booking_duration <= end_time
      slot_end_time = start_time + booking_duration
      slot_end_time_minus_1_minute = slot_end_time - 1.minute
      overlapping_booking = @venue.bookings.where(date: date, start_time: start_time.strftime("%H:%M")..slot_end_time_minus_1_minute.strftime("%H:%M")).first
      
      if overlapping_booking.nil?
        available_slots << { start_time: start_time.strftime("%H:%M"), end_time: slot_end_time.strftime("%H:%M") }
        start_time += booking_duration
      else
        start_time = overlapping_booking.end_time.to_time
      end
    end

    available_slots
  end

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name, :facility_id)
  end
end
