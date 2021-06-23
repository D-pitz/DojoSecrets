class SecretsController < ApplicationController
    before_action :require_login
    
    def index
        @secrets = Secret.all
    end
    
    def create
        @secret = Secret.create(secret_params)
        if @secret.save
            redirect_to "/secrets"
        else 
            flash[:errors] = @secret.errors.full_messages
            redirect_to :back
        end
    end

    def destroy
        @secret = Secret.find(params[:id])
        if @secret.user_id == current_user.id
            Secret.find(params[:id]).destroy
            flash[:success] = "Secret successfully deleted"
            redirect_to :back
        else 
            flash[:alert] = "Stop Hacking..."
            redirect_to :back
        end
    end
    

    private 
    def secret_params
        params.require(:secret).permit(:content, :user_id)
    end

    def user_login
        params.require(:user).permit(:email, :password)
    end
end
