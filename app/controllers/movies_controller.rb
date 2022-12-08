class MoviesController < ApplicationController
  def show
    if @movies = Movie.all(params).sample
      flash.now[:success] = t('.success')
    else
      flash.now[:danger] = t('.fail')
      redirect_back(fallback_location: root_path)
    end
    @movie_id = @movies.id
  end

  def likes
    @likes = TmdbApi.like(params)
  end

  def like_movies
    @movie_id = params[:movie_id]
    @like_movies = TmdbApi.like_movies(params).first
    @comment = Comment.new
    @comments = Comment.where(movie_id: @movie_id).order(created_at: :desc)
  end
end
