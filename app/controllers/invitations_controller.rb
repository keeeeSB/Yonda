class InvitationsController < ApplicationController

  def new
  end

  def create
    email = params[:email]
    if email.present?
      InvitationMailer.invite_email(email).deliver_now
      flash[:success] = "家族招待メールを送信しました"
      redirect_to home_path
    else
      flash.now[:danger] = "メールアドレスを確認してください"
      render :new
    end
  end
end
