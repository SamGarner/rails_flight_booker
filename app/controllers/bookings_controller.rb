class BookingsController < ApplicationController
  def new
    if params[:flight_id]
      @booking_flight_id = params[:flight_id]
      @booking_flight = Flight.find(params[:flight_id])
      @booking = Booking.new(flight_id: params[:flight_id])
      @passenger_count = params[:passenger_count].to_i
      @passenger_count.times { @booking.passengers.build }

      render :new
    else
      flash[:notice] = 'Please select a flight before proceeding.'
      redirect_to :root
    end
  end

  def create
    @new_booking = Booking.new(whitelisted_booking_params)
    if @new_booking.save
      flash.now[:success] = 'Booking complete. Enjoy your trip!'
      # @passengers = Passenger.find_by booking_id: @new_booking.id #only gets first match :()
      @passengers = Passenger.where(booking_id: @new_booking.id)
      render :show
      PassengerMailer.with(passengers: @passengers, confirmation_number: @new_booking.id).confirmation_email.deliver_now
    else
      @booking_flight_id = params[:booking][:flight_id]
      @booking_flight = Flight.find(params[:booking][:flight_id])
      @booking = Booking.new(flight_id: params[:flight_id])
      @passenger_count = 0
      params[:booking][:passengers_attributes].each do
        @passenger_count += 1
      end
      @passenger_count.times { @booking.passengers.build }
      flash.now[:error] = 'Error. Please confirm passenger details and try again.'
      render :new
    end
  end

  def index
  end

  def show
  end

  def destroy
  end

  private

  def whitelisted_booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
