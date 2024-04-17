class PasswordResetsController < ApplicationController
  before_action :set_user, only: %i[create edit update]

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

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
