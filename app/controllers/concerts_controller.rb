class ConcertsController < ApplicationController
  before_action :set_concert, only: [:show, :edit, :update, :destroy]
  # before_action :redirect_if_not_authorized!, only: [:edit, :update, :destroy]
  before_action :current_user

  def index
    @user = current_user
    @concerts = Concert.all
  end

  def this_month
    @concerts = Concert.this_month
    render :this_month
  end

  def new
    @concert = Concert.new
    @user = User.find_by(id: params[:user_id])
    @concert.user_concerts.build
  end

  def create
      @concert = Concert.create(concert_params)
      @user = User.find_by(id: params[:user_id])
      if @concert.save
        redirect_to concert_path(@concert)
      else
        flash[:message] = 'Unable to add concert.'
        redirect_to new_user_concert_path
      end
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
    redirect_to concerts_path
  end

  private

  def concert_params
    params.require(:concert).permit(:date, :band_name, :concert_time, :user_id)
  end

  def set_concert
    @concert = Concert.find_by(id: params[:id])
  end

  # def redirect_if_not_authorized!
  #   if @user != current_user
  #     flash[:message] = 'Unauthorized action.'
  #     redirect_to concerts_path
  #   end
  # end


end
