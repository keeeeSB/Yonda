class InvitationsController < ApplicationController

  def new
  end

  def create
    email = params[:email]
    inviter = current_user
    if email.present?
      invite_token = SecureRandom.urlsafe_base64
      InvitationMailer.invite_email(email, inviter, invite_token).deliver_now
      flash[:success] = "家族招待メールを送信しました"
      redirect_to home_path
    else
      flash.now[:danger] = "メールアドレスを確認してください"
      render :new
    end
  end
end
