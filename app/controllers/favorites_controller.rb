class FavoritesController < ApplicationController

  def create
    @read_record_favorite = Favorite.new(user_id: current_user.id, read_record_id: params[:read_record_id])
    @read_record_favorite.save
    redirect_to home_path
  end

  def destroy
    @read_record_favorite = Favorite.find_by(user_id: current_user.id, read_record_id: params[:read_record_id])
    @read_record_favorite.destroy
    redirect_to home_path
  end
end
