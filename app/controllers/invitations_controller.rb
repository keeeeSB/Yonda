class InvitationsController < ApplicationController

  def new
  end

  def create
    email = params[:email]
    if email.present?
      InvitationMailer.invite_email(email).deliver_now
      redirect_to home_path, success: "家族招待メールを送信しました"
    else
      flash.now[:danger] = "メールアドレスを確認してください"
      render :new
    end
  end
end
