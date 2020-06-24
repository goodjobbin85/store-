class SessionsController < ApplicationController
  def new
  end

  def create
    if auth
       user = User.from_omniauth(auth)
        user.save
        login(user)
        redirect_to user_path(user)
    else
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
  end

  def destroy
    logout
    redirect_to root_path
  end

  private

  def auth
     request.env['omniauth.auth']
  end

end
