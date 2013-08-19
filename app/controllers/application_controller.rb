class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #force_ssl
  private

  def current_user
    @current_author ||= Author.find(session[:author_id]) if session[:author_id]
  end

  helper_method :current_user

  def logged_in?
    not current_user.nil?
  end

  def ensure_logged_in
    redirect_to new_session_path unless logged_in?
  end
end
