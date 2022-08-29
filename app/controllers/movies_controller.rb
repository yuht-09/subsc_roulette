class MoviesController < ApplicationController
    require 'themoviedb-api'
    Tmdb::Api.key("dbe29fe1b6b50465b49fb627d73149ac")
    Tmdb::Api.language("ja") 
end
