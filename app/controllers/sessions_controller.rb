class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where({ email: params["email"] })[0]
    if @user
      if BCrypt::Password.new(@user.password) == params["password"]
        session[:user_id] = @user.id
        flash[:notice] = "Welcome, #{@user.username}."
        redirect_to "/places"
      else
        flash[:notice] = "Wrong username and/or password."
        redirect_to "/sessions/new"
      end
    else
      flash[:notice] = "Wrong username and/or password."
      redirect_to "/sessions/new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Goodbye."
    redirect_to "/sessions/new"
  end
  
end
  