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
    @movie_id = params[:movie_id].to_i
    uri = URI.parse("https://api.themoviedb.org/3/tv/#{@movie_id}?api_key=#{ENV['API_KEY']}&language=ja-JP")
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)
    @like_movies = result
  end
end
