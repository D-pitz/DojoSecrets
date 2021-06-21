class SecretsController < ApplicationController
    
    def new
    end
    
    def create
        @secret = secret.create(secret_params)
        @secret.likes = 0
        if @secret.save
            redirect_to :back
        else 
            flash[:errors] = @secret.errors.full_messages
            redirect_to :back
        end
    end
    
    def index
        @secrets = Secret.all
    end

    private 
    def secret_params
        params.require(:secret).permit(:context, :user_id)
    end
end
