class StaticPagesController < ApplicationController
  def home
    if !logged_in?
      redirect_to signup_path
    end
    @microposts = @current_user.microposts
                              .build
    @feed_items = @current_user.feed
                               .paginate(page: params[:page],
                                         per_page: 10)
  end

  def ranking
    like_count_id = Like.group(:micropost_id)
                        .count(:micropost_id)
                        .order('count(micropost_id) desc')
                        .limit(5)
                        .keys
    @feed_items = like_count_id.map { |id| Micropost.find(id) }
  end

  def create_micropost
    @micropost = current_user.microposts.build if logged_in?
  end
end
