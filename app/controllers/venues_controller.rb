class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def create
    if current_user.admin?
      @venue = Venue.new(venue_params)
      if @venue.save
        redirect_to venue_path(@venue)
      else
        flash[:message] = 'Unable to add venue.'
        render :new
      end
    else
      flash[:message] = 'Only admins can add venues.'
      redirect_to venues_path
    end
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @venue = Venue.find_by(id: params[:id])
  end

  def edit
    if current_user.admin?
      @venue = Venue.find_by(id: params[:id])
    end
  end

  def update
    if current_user.admin?
      @venue = Venue.find_by(id: params[:id])
      if @venue.update(venue_params)
        flash[:message] = 'Venue information successfully updated.'
        redirect_to venue_path(@venue)
      else
        render :edit
      end
    else
      redirect_to venues_path
      flash[:message] = 'Only admins can edit venue information.'
    end
  end

  def destroy
    if current_user.admin?
      @venue = Venue.find_by(id: params[:id])
      @venue.destroy
      flash[:message] = 'Venue successfully deleted.'
      redirect_to venues_path
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :location)
  end


end
