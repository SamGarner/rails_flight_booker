# 
class BookingsController < ApplicationController
  def new
    if params[:flight_id]
      @booking_flight_id = params[:flight_id]
      @booking_flight = Flight.find(params[:flight_id])
      @booking = Booking.new(flight_id: params[:flight_id]) # nothing saved to DB
      @passenger_count = params[:passenger_count].to_i
      @passenger_count.times { @booking.passengers.build } # nothing saved to DB

      render :new
    else
      flash[:notice] = 'Please select a flight before proceeding.'
      redirect_to :root
    end
  end

  def create
  end

  def index
  end

  def show
  end

  def destroy
  end
end
