class ChildrenController < ApplicationController
  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    if @child.save
      redirect_to family_path(current_user), success: t(".success")
    else
      flash.now[:danger] = t(".failure")
      render :new
    end
  end

  private

  def child_params
    params.require(:child).permit(:name, :gender, :birthday, :family_id)
  end
end
