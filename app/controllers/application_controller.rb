class ApplicationController < ActionController::Base

  private

  def current_user
    User.first 
  #  @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

end
