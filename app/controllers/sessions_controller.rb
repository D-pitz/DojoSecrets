class SessionsController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
  end

  def create
    if @user = User.find_by_email(user_login[:email]).try(:authenticate, user_login[:password])
      session[:user] = @user.id
      flash[:success] = "#{@user.name} successfully logged in."
      redirect_to "/users/#{current_user.id}"
    else
      flash[:errors] = "Name or password incorrect"
      redirect_to :back
    end
  end

  def destroy
    reset_session
    flash[:success] = "Successfully logged out."
    redirect_to "/sessions/new"
  end
  
  private
  def user_login
    params.require(:user).permit(:email, :password)
  end
end
