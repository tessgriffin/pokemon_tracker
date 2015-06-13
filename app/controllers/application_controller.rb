class ApplicationController < ActionController::Base
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorize!

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id] )
  end

  def authorize!
    redirect_to root_path unless current_user
  end
end
