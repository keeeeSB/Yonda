class ChildrenController < ApplicationController
  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    if @child.save
      flash[:success] = "お子さまを追加しました"
      redirect_to @family
    else
      flash.now[:danger] = "お子さまを追加できませんでした"
      render :new
    end
  end
end
