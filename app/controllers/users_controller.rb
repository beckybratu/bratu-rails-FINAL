class UsersController < ApplicationController
   before_action :current_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "You've been successfully signed up."
      redirect_to concerts_path
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @concerts = Concert.where(user_id: @user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
