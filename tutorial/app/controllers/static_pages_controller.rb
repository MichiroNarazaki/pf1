class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 12)
    else
      redirect_to signup_path
    end
  end

  def help
  end

  def about
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
