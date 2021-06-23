class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create]
    before_action :user_match, only: [:show, :edit, :destroy, :update]

    def create 
        @user = User.create(user_params)
        if @user.save
            flash[:success] = "#{@user.name} successfully created."
            session[:user] = @user.id
            redirect_to '/'
        else 
            flash[:errors] = @user.errors.full_messages
            redirect_to :back
        end
    end

    def update
        @user = User.find(current_user.id)
        @user.update(user_update)
        if @user.valid?
            @user.save
            flash[:success] = "#{current_user.name} succesfully updated"
        redirect_to "/users/#{current_user.id}"
        else 
            flash[:errors] = @user.errors.full_messages
            redirect_to :back
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def user_update
        params.require(:user).permit(:name, :email)
    end

    def user_match
        redirect_to "/users/#{current_user.id}" unless current_user.id == params[:id].to_i
    end
end
