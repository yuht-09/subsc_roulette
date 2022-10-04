class LikesController < ApplicationController
  def create
    @movie_id = params[:movie_id]
    @like = current_user.likes.create(movie_id: @movie_id)
  end
    
  def destroy
    @movie_id = params[:movie_id]
    @like = current_user.likes.find_by(movie_id: @movie_id)
    @like.destroy
  end
end
