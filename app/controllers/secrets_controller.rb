class SecretsController < ApplicationController
    before_action :require_login
    before_action :user_match except: [:show]
    
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
        Secret.find(params[:id]).destroy
        redirect_to :back
    end
    

    private 
    def secret_params
        params.require(:secret).permit(:content, :user_id)
    end

    def user_login
        params.require(:user).permit(:email, :password)
    end
end
