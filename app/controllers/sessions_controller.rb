class SessionsController < ApplicationController

  def new
  end

  def create
    session = session_params(:name, :password)
    if session[:name].present? && session[:password].present?
      redirect_to welcome_path
    else
      render :new
    end
  end

  def destroy
    if session[:name].present? || session[:password].present?
      session.clear
    end
      redirect_to login_path
  end

  private

  def session_params(*args)
    params.require(:session).permit(*args)
  end
end
