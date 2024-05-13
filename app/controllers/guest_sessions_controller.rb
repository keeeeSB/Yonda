class GuestSessionsController < ApplicationController

  def create
    user = User.find_or_create_by(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
    end
    session[:user_id] = user.id
    flasf[:success] = t(".success")
  end
end
