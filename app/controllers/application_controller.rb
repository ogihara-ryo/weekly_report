class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  before_action :signin_required

  private

  def redirect_back_or(default)
    redirect_to(session[:request_from] || default)
    session[:request_from] = nil
  end

  def signin_required
    return if signed_in?
    set_request_from
    redirect_to signin_path
  end

  def set_request_from
    session[:request_from] = request.fullpath
  end
end
