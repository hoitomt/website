class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    logger.info("Current User: #{@current_user.email if @current_user}")
    return @current_user
  end
end
