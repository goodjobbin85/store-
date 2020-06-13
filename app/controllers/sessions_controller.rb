class SessionsController < ApplicationController
  def new

  end

  def create
    if auth = request.env["omniauth.auth"]
      #login as omniauth
      user = User.find_or_create_by(email: auth['email']) do |u|
        u.name = auth['info']['name']
        u.uid = auth['info']['uid']
        u.image = auth['info']['image']
      end
      if user.save
        login(user)
        redirect_to users_path
      else
        redirect_to login_path
      end
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
end
