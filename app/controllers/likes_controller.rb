class LikesController < ApplicationController
    def create
        if current_user.guest
            flash[:danger] = "いいねするには登録してください"
        else
            @like = current_user.likes.create(micropost_id: params[:micropost_id])
        end
        redirect_back(fallback_location: root_path)
    end
    def destroy
        @like = Like.find_by(micropost_id: params[:micropost_id],user_id: current_user.id)
        @like.destroy
        redirect_back(fallback_location: root_path)
    end
end
