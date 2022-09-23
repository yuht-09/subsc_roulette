class MoviesController < ApplicationController
  def index
    @movies = Movie.all(params).sample
  end

  def show
    uri = URI.parse("https://api.themoviedb.org/3/discover/tv?api_key=#{ENV['API_KEY']}&language=ja-JP&with_networks=213&with_genres=16|35&page=1")
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)
    @netflex = result["results"]
  end
end
