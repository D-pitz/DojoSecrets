class SecretsController < ApplicationController
    
    def index
        @secrets = Secret.all
        @likes = Like.all.count
    end
    
    def new
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
    

    private 
    def secret_params
        params.require(:secret).permit(:content, :user_id)
    end
end
