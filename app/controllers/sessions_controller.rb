class SessionsController < ApplicationController
  def new

  end

  def create
    if auth
      #login as omniauth
      #user = User.find_or_create_by(email: auth['email']) do |u|
      #  u.name = auth['info']['name']
      ##  u.image = auth['info']['image']
      #end
      #if user.save
      #  login(user)
      #  redirect_to users_path
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

  #def omniauth
  #    if params[:provider] == "facebook"
  #        user = User.from_omniauth(auth)
  #        user.save
  #        session[:user_id] = user.id
  #        redirect_to user_path(user)
  #    end
  #end

  private

  def auth
     request.env['omniauth.auth']
  end

end
