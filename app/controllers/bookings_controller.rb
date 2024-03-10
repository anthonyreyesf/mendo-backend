class BookingsController < ApplicationController
  before_action :set_venue
  before_action :set_booking, only: %i[ show update destroy ]

  def index
    if @venue
      @bookings = @venue.bookings
    else
      @bookings = Booking.all
    end

    render json: @bookings.as_json(include: { customer: { only: [:first_name, :last_name, :email] }, venue: { only: [:name, :hourly_rate], include: { venue_type: { only: [:name] } } } })
  end

  def create
    @booking = @venue.bookings.build(booking_params)

    if @booking.save
      render json: @booking, status: :created
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  private

  def set_venue
    @venue = Venue.find(params[:venue_id]) if params[:venue_id]
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :customer_id)
  end
end
