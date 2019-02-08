class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to concerts_path
    else
      flash[:message] = "Oops! Something went wrong."
      redirect_to login_path 
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
