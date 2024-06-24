class FamiliesController < ApplicationController
  
  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      current_user.update(family_id: @family.id)
      flash[:success] = t(".success")
      redirect_to current_user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @family = current_user.family
  end

  def destroy
  end

  private

  def family_params
    params.require(:family).permit(:name, :introduction)
  end
end
