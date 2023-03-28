class MoviesController < ApplicationController
  def show
    if @movies = Movie.all(params).sample
      flash.now[:success] = t('.success')
    else
      flash.now[:danger] = t('.fail')
      redirect_back(fallback_location: root_path)
    end
    @movie_id = @movies.id
    @comments = Comment.where(movie_id: @movie_id).includes(:user).order(created_at: :desc)
  end

  def likes
    @likes = Movie.like(params)
  end

  def like_movies
    @movie_id = params[:movie_id]
    @like_movies = Movie.like_movies(params).first
    @comment = Comment.new
    @comments = Comment.where(movie_id: @movie_id).includes(:user).order(created_at: :desc)
  end
end
