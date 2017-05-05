class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:user][:name].present? && params[:user][:password].present?
      user = User.find_by(name: params[:user][:name])
        .try(:authenticate, params[:user][:password])
    end
    if !!user
      session[:user_id] = user.id
      redirect_to welcome_path
    else
      render :new
    end
  end

  def destroy
    if session[:user_id].present?
      session[:user_id] = nil
    end
    redirect_to login_path
  end
end
