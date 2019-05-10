class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to venue_path(@venue)
    else
      flash[:message] = 'Unable to add venue.'
      render :new
    end
  end

  def show
    @user = current_user
    @venue = Venue.find_by(id: params[:id])
  end

  def edit
    @venue = Venue.find_by(id: params[:id])
  end

  def update
    @venue = Venue.find_by(id: params[:id])
    if @venue.update(venue_params)
      flash[:message] = 'Venue information successfully updated.'
      redirect_to venue_path(@venue)
    else
      render :edit
    end
  end

  def destroy
    @venue = Venue.find_by(id: params[:id])
    @venue.destroy
    flash[:message] = 'Venue successfully deleted.'
    redirect_to venues_path
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :location)
  end


end
