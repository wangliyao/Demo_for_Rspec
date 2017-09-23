class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :user_set_up


  private
  def user_set_up
    if session[:user_id]
      (User.find_by_id(session[:user_id]) rescue nil)
    end
  end
end
