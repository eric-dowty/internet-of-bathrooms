class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= logged_in_user
  end

  def authorize!
    redirect_to root_path unless current_user && params[:controller] == 'bathrooms'
  end

  private

  def logged_in_user
    if session[:user_id]
      User.find(session[:user_id]) 
    else
      Guest.new
    end 
  end

end
