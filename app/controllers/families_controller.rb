class FamiliesController < ApplicationController
  
  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      flash[:success] = "家族情報の登録ができました"
      redirect_to @family
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @family = Family.find(current_user.family_id)
  end

  def destroy
  end

  private

  def family_params
    params.require(:family).permit(:name, :introduction)
  end
end
