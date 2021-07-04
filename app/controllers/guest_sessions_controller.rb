class GuestSessionsController < ApplicationController
  def create
    user = User.find_by(email: 'guest@example.com')
    log_in(user)
    flash[:success] = 'ゲストユーザーでログインしました'
    redirect_to root_path
  end
end
