class MoviesController < ApplicationController
  def index
    @movies = Movie.all(params).sample
    @movie_id = @movies.id
  end

  def show
    @bookmark = Like.where(user_id: current_user.id).order(created_at: :desc).pluck(:movie_id)
    @mark = []
    @bookmark.map do |id|
      uri = URI.parse("https://api.themoviedb.org/3/tv/#{id}?api_key=#{ENV['API_KEY']}&language=ja-JP")
      json = Net::HTTP.get(uri)
      result = JSON.parse(json)
      ppp = result
      @mark += [ppp]
    end
    
  end
end
