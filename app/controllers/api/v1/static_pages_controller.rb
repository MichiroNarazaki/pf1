module Api
  module V1
    class StaticPagesController < ApplicationController
      def home
        @microposts = Micropost.order(updated_at: :desc)
                               .limit(10)
        render json: { status: "SUCCESS", message: "Loaded posts", data: @microposts }
      end

      def ranking
        like_count_id = Like.group(:micropost_id)
                            .order("count(micropost_id) desc")
                            .count(:micropost_id)
                            .keys
                            .limit(5)
        @feed_items = like_count_id.map { |id| Micropost.find(id) }
      end

      # def create_micropost
      #   @micropost = current_user.microposts.build if logged_in?
      # end
    end
  end
end
