class ConcertsController < ApplicationController
  before_action :set_concert, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_authorized!, only: [:edit, :update, :destroy]

  def index
    if params[:user_id]
      @nested = true
      @user = User.find_by(id: params[:user_id])
      @concerts = @user.concerts
    else
      @concerts = Concert.all
    end
  end

  def new
    @concert = Concert.new
  end

  def create
    @concert = current_user.concerts.create(concert_params)
    if @concert.save
      redirect_to concert_path(@concert)
    else
      flash[:message] = 'Unable to add concert.'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @concert.update(concert_params)
      flash[:message] = 'Concert information successfully updated.'
      redirect_to concert_path(@concert)
    else
      render :edit
    end
  end

  def destroy
    @concert.destroy
    flash[:message] = 'Concert successfully deleted.'
    redirect_to concerts_path
  end

  private

  def concert_params
    params.require(:concert).permit(:date, :band_name, :concert_time)
  end

  def set_concert
    @concert = Concert.find_by(id: params[:id])
  end

  def redirect_if_not_authorized!
    if @concert.user != current_user
      redirect_to '/concerts'
    end
  end

end
