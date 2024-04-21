class PasswordResetsController < ApplicationController
  before_action :set_user, only: %i[edit update]
  before_action :valid_user, only: %i[edit update]
  before_action :check_expiration, only: %i[edit update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:success] = t(".success")
      redirect_to root_url
    else
      flash.now[:danger] = t(".failure")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if params[:user][:password].blank?
      @user.errors.add(:password, :blank)
      render :edit, status: :unprocessable_entity
    elsif @user.update(user_params)
      log_in @user
      flash[:success] = t(".success")
      redirect_to @user
    else
      flash.now[:danger] = t(".failure")
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find_by(email: params[:email])
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  # 正しいユーザーかどうか確認する
  def valid_user
    unless (@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end

  # トークンが期限切れかどうか確認する
  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = "有効期限を過ぎているため、パスワードの再設定ができません。"
      redirect_to new_password_reset_url
    end
  end
end
