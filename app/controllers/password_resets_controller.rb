class PasswordResetsController < ApplicationController
  before_action :set_user, only: %i[create edit update]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      PasswordResetMailer.with(user: @user).reset.deliver_later
      flash[:success] = t(".success")
      redirect_to root_path
    else
      flash.now[:danger] = t(".failure")
      render :new
    end
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  end

  def update
    if @user.update(password_params)
      flash[:success] = t(".success")
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find_by(email: params[:email])
  end
end
