class MoviesController < ApplicationController
  def index
    hulu = Movie.hulu.shuffle
    @hulu = [hulu.first]

    netflex = Movie.netflex.shuffle
    @netflex = [netflex.first]
  end

  def show
    uri = URI.parse("https://api.themoviedb.org/3/discover/tv?api_key=dbe29fe1b6b50465b49fb627d73149ac&language=ja-JP&with_networks=213&with_genres=16|35&page=1")
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)
    @netflex = result["results"]
  end
end
