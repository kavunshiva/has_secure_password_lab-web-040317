class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user = User.find_by(id: session[:id])
  end

  def authenticate
    if !logged_in?
      flash[:notice] = "You need to be logged in to do that."
      redirect_to login_path
    end
  end

  def logged_in?
    session[:user_id].present?
  end
end
