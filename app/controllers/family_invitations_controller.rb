class FamilyInvitationsController < ApplicationController

  def new
    @user = User.new
    @user.email = params[:email] if params[:email].present?
    @user.invite_token = params[:invite_token] if params[:invite_token].present?
  end

  def create
    @user = User.new(user_params)
    @user.email = params[:email] if params[:email].present?
    @user.invite_token = params[:invite_token] if params[:invite_token].present?
    if @user.save
      reset_session
      log_in @user
      redirect_to family_path(@user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :family_id)
  end
end
