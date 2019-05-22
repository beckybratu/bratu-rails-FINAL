class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path 
    else
      flash[:message] = "Oops! Something went wrong."
      redirect_to login_path
    end
  end

  def create_from_omniauth
    @user = User.find_or_create_by(email: auth[:info][:email]) do |user|
      user.name = auth[:info][:name]
      user.password = SecureRandom.hex
    end

    session[:user_id] = @user.id

    if logged_in?
      flash[:message] = "Succesfully logged in via Google."
    else
      flash[:message] = "Something went wrong."
    end

    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
