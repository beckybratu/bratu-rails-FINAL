class ConcertsController < ApplicationController
  before_action :set_concert, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_authorized!, only: [:edit, :update, :destroy]
  before_action :find_user

  def index
    if params[:user_id]
      @concerts = current_user.concerts
    else
      @concerts = Concert.all
    end
  end


  def new
    @concert = Concert.new
    @concert.user_concerts.build
  end

  def create
      @concert = Concert.create(concert_params)

      if @concert.save
        redirect_to user_concerts_path(@concert)
      else
        flash[:message] = 'Unable to add concert.'
        render :new
      end


    # if @concert = Concert.find_by(id: concert_params[:id])
    #   @concert.update(concert_params)
    #   redirect_to user_concerts_path
    # else
    #   @concert = Concert.create(concert_params)
    #   redirect_to user_concerts_path
    #  end
  end

  def show
  end

  def edit
  end

  def update
    @concert.update(concert_params)
    redirect_to user_concerts_path
    flash[:message] = 'Concert information successfully updated.'
  end

  def destroy
    @concert.destroy
    flash[:message] = 'Concert successfully deleted.'
    redirect_to user_concerts_path
  end

  private

  def concert_params
    params.require(:concert).permit(:date, :band_name, :concert_time, :user_id)
  end

  def set_concert
    @concert = Concert.find_by(id: params[:id])
  end

  def redirect_if_not_authorized!
    if @concert.user != current_user
      redirect_to '/concerts'
    end
  end

  def find_user
    @user = User.find_by(id: params[:user_id])
  end


end
