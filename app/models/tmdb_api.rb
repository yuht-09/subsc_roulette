class TmdbApi
  class << self
    def all(params = {})
      provider_id = params[:provider_id]
      genre_id = params[:genre_id]
      provider = URI.encode_www_form({with_networks: provider_id})
      genre = URI.encode_www_form({with_genres: genre_id})
      uri = URI.parse("https://api.themoviedb.org/3/discover/tv?api_key=#{ENV['API_KEY']}&language=ja-JP&#{provider}&#{genre}")
      json = Net::HTTP.get(uri)
      data_list = JSON.parse(json)
      uri = URI.parse("https://api.themoviedb.org/3/discover/tv?api_key=#{ENV['API_KEY']}&language=ja-JP&#{provider}&#{genre}&page=#{rand(data_list['total_pages'])+1}")
      json = Net::HTTP.get(uri)
      data_list = JSON.parse(json)
      movie = data_list["results"]
      movie.map do |data|
        Movie.new(data)
      end
    end
  end
end
