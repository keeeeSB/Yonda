class PasswordResetsController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:success] = t(".success")
      redirect_to root_path
    else
      flash.now[:danger] = t(".failure")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end
end
