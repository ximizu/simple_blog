module ApplicationHelper
  def user_connected
    session[:user] != nil
  end

  def current_user
    session[:user]
  end
end
