class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "アカウント有効化についてのご連絡"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "パスワードリセットについてのご連絡"
  end
end