class ApplicationController < ActionController::Base
  include SessionsHelper
  private
    # ユーザーのログインとゲストではないかを確認する
    def logged_in_user
      #ログインしていない場合はsignupページにリダイレクト
      if logged_in?
        if current_user.guest
          store_location
          flash[:danger] = "ログインしてください"
          redirect_to user_path(guest_user)
        end
        #ゲストログインをしている場合はゲストのuserページ(signupフォームがある)にリダイレクト
      else
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to signup_path
      end
    end
end
