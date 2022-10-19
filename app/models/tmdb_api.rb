class TmdbApi
  class << self
    def all(params = {})
      provider_id = params[:provider_id]
      genre_id = params[:genre_id]
      provider = URI.encode_www_form({with_networks: provider_id})
      genre = URI.encode_www_form({with_genres: genre_id})
      tmdb = URI.parse("https://api.themoviedb.org/3/discover/tv?api_key=#{ENV['API_KEY']}&language=ja-JP&#{provider}&#{genre}")
      response = Net::HTTP.get(tmdb)
      tmdb_list = JSON.parse(response)
      uri = URI.parse("https://api.themoviedb.org/3/discover/tv?api_key=#{ENV['API_KEY']}&language=ja-JP&#{provider}&#{genre}&page=#{rand(tmdb_list['total_pages'])+1}")
      json = Net::HTTP.get(uri)
      data_list = JSON.parse(json)
      movie = data_list["results"]
      movie.map do |data|
        Movie.new(data)
      end
    end

    def like(params = {})
      user_id = params[:user_id]
      likes = Like.where(user_id: user_id).order(created_at: :desc).pluck(:movie_id)
      @likeslist = []
      likes.map do |id|
      uri = URI.parse("https://api.themoviedb.org/3/tv/#{id}?api_key=#{ENV['API_KEY']}&language=ja-JP")
      json = Net::HTTP.get(uri)
      result = JSON.parse(json)
      likeslist = result
      @likeslist += [likeslist]
      end
      list = @likeslist
      list.map do |list|
        Movie.new(list)
      end
    end

    def like_movies(params = {})
      movie_id = params[:movie_id].to_i
      uri = URI.parse("https://api.themoviedb.org/3/tv/#{movie_id}?api_key=#{ENV['API_KEY']}&language=ja-JP")
      json = Net::HTTP.get(uri)
      result = JSON.parse(json)
      movie = [result]
      movie.map do |data|
        Movie.new(data)
      end
    end
  end
end
