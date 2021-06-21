class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = User.find_by_email(user_login[:email]).try(:authenticate, user_login[:password])
      session[:user] = @user.id
      flash[:success] = "#{@user.name} successfully logged in."
      redirect_to "/sessions/new"
    else 
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    reset_session
    redirect_to "/users/new"
  end
  private
  def user_login
    params.require(:user).permit(:email, :password)
  end
end
