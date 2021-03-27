class StaticPagesController < ApplicationController
  def home
    redirect_to signup_path unless logged_in?
    @micropost = current_user.microposts
                             .build
    @feed_items = current_user.feed
                              .paginate(page: params[:page], per_page: 10)
  end

  def ranking
    like_count_id = Like.group(:micropost_id)
                        .order('count(micropost_id) desc')
                        .limit(5)
                        .count(:micropost_id)
                        .keys
    @feed_items = like_count_id.map { |id| Micropost.find(id) }
  end

  def create_micropost
    @micropost = current_user.microposts.build if logged_in?
  end
end
