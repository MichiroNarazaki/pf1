class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 10)
    else
      redirect_to signup_path
    end
  end

  def ranking
    like_count_id = Like.group(:micropost_id).order('count(micropost_id) desc').limit(5).count(:micropost_id).keys
    @feed_items = like_count_id.map{|id| Micropost.find(id)}
  end

  def create_micropost
    if logged_in?
      @micropost = current_user.microposts.build
    end
  end
end
