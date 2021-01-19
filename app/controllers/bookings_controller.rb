class BookingsController < ApplicationController
  def new
    if params[:flight_id]
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
