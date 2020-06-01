class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      login(user)
      flash[:notice] = "Welcome back"
      redirect_to user_path(user)
    else
      render 'new'
      flash[:notice] = "Please try again"
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
