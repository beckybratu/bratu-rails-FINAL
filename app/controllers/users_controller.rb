class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "You've been successfully signed up."
      redirect_to user_concerts_path
    else
      render :new
    end
  end

  def show
    if params[:user_id]
      @concerts = current_user.concerts
    else
      @concerts = Concert.all
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
