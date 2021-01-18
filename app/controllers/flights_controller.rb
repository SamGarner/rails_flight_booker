class FlightsController < ApplicationController
  def index
    if params[:departure_id] || params[:arrival_id] || params[:take_off] || params[:passenger_count]
      @flights = Flight.search(params[:departure_id], params[:arrival_id], params[:take_off])
      @passenger_count = params[:passenger_count]
    else
      @flights = []
      @passenger_count = 0
    end

    @departure_options = Flight.all.map { |d| [d.departure.city, d.departure_id] }
    @arrival_options = Flight.all.map { |a| [a.arrival.city, a.arrival_id] }
    @date_options = Flight.all.map { |date| [date.drop_down_date, date.database_date] }.uniq { |d| d[0] }
    @passenger_count_options = [[1, 1], [2, 2], [3, 3], [4, 4]]
  end

  def new
  end

  def show
  end

  def create
  end

  private

  def allowed_flight_params
    params.permit(:departure_id, :arrival_id)
  end
end
