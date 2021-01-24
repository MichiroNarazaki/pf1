class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 10)
    else
      redirect_to signup_path
    end
  end

  def help
  end

  def about
  end

  def ranking
    @all_ranks = Micropost.find(Like.group(:micropost_id).order('count(micropost_id) desc').limit(5).pluck(:micropost_id))
  end
  def contact
  end

  def create_micropost
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
end
