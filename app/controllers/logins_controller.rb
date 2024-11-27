class LoginsController < ApplicationController
  def new
    redirect_to "/" if session[:user_id]
    @user = User.new
  end

  def create
    @user = User.find_by(login_params)
    if @user
      session[:user] = @user
      session[:user_id] = @user.id
      redirect_to "/"
    end
  end

  def logout
    session[:user] = nil
    session[:user_id] = nil
    redirect_to "/"
  end

  private

    def login_params
      params.expect(user: [ :email, :password ])
    end
end
