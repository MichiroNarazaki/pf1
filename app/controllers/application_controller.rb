class ApplicationController < ActionController::Base
  include SessionsHelper
  private
    # ユーザーのログインとゲストではないかを確認する
    def logged_in_user
      unless logged_in? && !current_user.guest
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to user_path(guest_user)
      end
    end
end
