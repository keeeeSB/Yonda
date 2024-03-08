class ChildrenController < ApplicationController
  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    @family = Family.find(params[:id])
    if @child.save
      flash[:success] = "お子さまを追加しました"
      redirect_to @family
    else
      flash.now[:danger] = "お子さまを追加できませんでした"
      render :new
    end
  end

  private

  def child_params
    params.require(:child).permit(:name, :gender, :birthday, :family_id)
  end
end
