class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(movie_id: params[:movie_id])
    redirect_back(fallback_location: show_path)
  end
    
  def destroy
    @like = current_user.likes.find_by(movie_id: params[:movie_id])
    @like.destroy
    redirect_back(fallback_location: show_path)
  end
end
