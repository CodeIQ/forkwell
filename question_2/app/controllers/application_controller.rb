class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :user_signed_in?

  def current_user
    @current_user ||= User.find(session[:current_user])
  rescue ActiveRecord::RecordNotFound
    nil
  end

  def user_signed_in?
    !!current_user
  end
end
