class ApplicationController < ActionController::Base
  def login(user)
    session[:user_id] = user.id
  end
  helper_method :login

  def logout
    session[:user_id] = nil
  end
  helper_method :logout

  def logged_in?
    !session[:user_id].nil?
  end
  helper_method :logged_in?

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
