class MoviesController < ApplicationController
  def index
    @movies = Movie.all(params).sample
    @movie_id = @movies.id
  end

  def likes
    @likes = Like.where(user_id: current_user.id).order(created_at: :desc).pluck(:movie_id)
    @likeslist = []
    @likes.map do |id|
      uri = URI.parse("https://api.themoviedb.org/3/tv/#{id}?api_key=#{ENV['API_KEY']}&language=ja-JP")
      json = Net::HTTP.get(uri)
      result = JSON.parse(json)
      likeslist = result
      @likeslist += [likeslist]
    end
  end

  def like_movies
    @movie_id = params[:movie_id].to_i
    uri = URI.parse("https://api.themoviedb.org/3/tv/#{@movie_id}?api_key=#{ENV['API_KEY']}&language=ja-JP")
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)
    @like_movies = result
  end
end
