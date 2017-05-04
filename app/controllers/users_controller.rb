class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:name, :password, :password_confirmation))
    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end

end