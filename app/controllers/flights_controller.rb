class FlightsController < ApplicationController
  def index
    # @flights = Flight.search(params[:departure_id], params[:arrival_id])

    if params[:departure_id] || params[:arrival_id] #|| params[:take_off] || params[:passenger_count]
      # @flights = []
      @flights = Flight.search(params[:departure_id], params[:arrival_id])
      # @flights = @flights || Flight.all
    else
      # @flights = Flight.all
      # @flights = Flight.new
      @flights = []
    end
    # @flights = Flight.all

    @departure_options = Flight.all.map { |d| [d.departure.city, d.departure_id] }
    @arrival_options = Flight.all.map { |a| [a.arrival.city, a.arrival_id] }
    @date_options = Flight.all.map { |date| [date.formatted_date, date] }
    @passenger_count_options = [[1, 1], [2, 2], [3, 3], [4, 4]]
  end

  def new
  end

  def show
  end

  def create
  end

  private

  # def allowed_flight_params
  #   params.require(:flight).permit(:departure_id, :arrival_id, :take_off, :passenger_count)
  # end

  # def allowed_flight_params
  #   params.fetch(:flight, {}).permit(:departure_id, :arrival_id)# unless params(:flight).empty? #, :take_off, :passenger_count)
  # end

  def allowed_flight_params
    params.permit(:departure_id, :arrival_id)# unless params(:flight).empty? #, :take_off, :passenger_count)
  end
end
