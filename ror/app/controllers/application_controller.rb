class ApplicationController < ActionController::Base

  before_action :auth_check

  helper_method :is_logged?, :current_user

  def is_logged?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def auth_check (redirect_url = nil)
    unless is_logged?
      redirect_url = redirect_url ? redirect_url : login_path
      redirect_to redirect_url
    end
  end

  def index
    
  end

end
