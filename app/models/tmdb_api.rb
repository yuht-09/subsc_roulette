class TmdbApi
  class << self
    def netflex(params = {})
      uri = URI.parse('https://api.themoviedb.org/3/discover/tv?api_key=dbe29fe1b6b50465b49fb627d73149ac&language=ja-JP&with_networks=213&with_genres=16|35&page=1')
      json = Net::HTTP.get(uri)
      data_list = JSON.parse(json)
      keita = data_list["results"]
      keita.map do |data|
        Movie.new(data)
      end
    end
    
    def hulu(params = {})
      uri = URI.parse('https://api.themoviedb.org/3/discover/tv?api_key=dbe29fe1b6b50465b49fb627d73149ac&language=ja-JP&with_networks=1772&with_genres=16|35&page=1')
      json = Net::HTTP.get(uri)
      data_list = JSON.parse(json)
      keita = data_list["results"]
      keita.map do |data|
        Movie.new(data)
      end
    end

  end
end
