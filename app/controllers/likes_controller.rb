class LikesController < ApplicationController
    
    def create
        @like = Like.create(like_params)
        @like.update(secret_id: params[:secret_id])
        @like.save
        puts "created like"
        redirect_to :back
    end

    def destroy
        Like.find_by(user_id:current_user.id, secret_id:params[:secret_id]).destroy
        redirect_to :back
    end

    private
    def like_params
        params.require(:like).permit(:user_id)
    end
end
