class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in(user)
        params[:session][:remember_me] == "1" ? remember(user) : forget(user)
        flash[:success] = "ログインに成功しました"
        redirect_to user
      else
        message = "アカウントが有効化されていません。"
        message += "届いたメールをご確認の上、アカウントを有効化してください。"
        flash[:danger] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "ログインに失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    log_out if logged_in?
    flash.now[:danger] = t(".success")
    redirect_to root_url, status: :see_other
  end
end
