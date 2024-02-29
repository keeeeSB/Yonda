class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      flash[:success] = "Yondaアプリへようこそ!"
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
