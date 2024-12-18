class RegistrationsController < ApplicationController
  def new
    redirect_to "/" if session[:user_id]
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to register_success_path
    else
    end
  end

  def success
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
