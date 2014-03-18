class TripsController < ApplicationController

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.create(trip_params)
    redirect_to "/trips/#{@trip.id}"
  end

  def show
    @trip = Trip.find(params[:id])
    @stops = @trip.stops
  end

private

def trip_params
  params.require(:trip).permit(:name)
end

end