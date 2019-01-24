class VenuesController < ApplicationController

  def new
    @venue = Venue.new 
  end

  def create
    @venue = current_user.venues.build(venue_params)
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :location)
  end

end
