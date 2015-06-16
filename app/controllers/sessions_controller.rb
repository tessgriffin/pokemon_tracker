 class SessionsController < ApplicationController

  skip_before_action :authorize!

  def create
      @user = User.find_or_create_by_auth(auth)
    if @user && auth.provider == "twitter"
      session[:user_id] = @user.id
      flash[:success] = "You successfully logged in."
      redirect_to pokemon_index_path
    else
      flash[:danger] = @user.errors.full_messages.join(", ")
      redirect_to root_path
    end
  end

  def new
  end

  def destroy
    session.clear
    flash[:success] = "You've successfully logged out"
    redirect_to root_path
  end


  private

  def auth
    request.env["omniauth.auth"]
  end
end