class ApplicationController < ActionController::Base
  before_action :authorize
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  protected

  def authorize
    redirect_to login_url, notice: 'Pleasel log in' unless User.find_by(id: session[:user_id])
  end
end
