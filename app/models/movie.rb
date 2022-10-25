class Movie
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :id, :integer
  attribute :name, :string
  attribute :overview, :string
  attribute :poster_path, :string
  attribute :backdrop_path, :string
  attribute :first_air_date, :string
  attribute :genre_ids, :integer
  attribute :origin_country, :string
  attribute :original_language, :string
  attribute :original_name, :string
  attribute :popularity, :integer
  attribute :vote_average, :integer
  attribute :vote_count, :integer

  attribute :adult, :string                        
  attribute :backdrop_path, :string
  attribute :created_by, :string                    
  attribute :episode_run_time, :string            
  attribute :first_air_date, :string         
  attribute :genres, :string
  attribute :homepage, :string
  attribute :id, :integer                       
  attribute :in_production, :string            
  attribute :languages, :string                     
  attribute :last_air_date, :string      
  attribute :last_episode_to_air, :string
  attribute :name, :string
  attribute :next_episode_to_air, :string
  attribute :networks, :string
  attribute :number_of_episodes, :integer
  attribute :number_of_seasons, :integer
  attribute :origin_country, :string
  attribute :original_language, :string
  attribute :original_name, :string
  attribute :overview, :string
  attribute :popularity, :integer
  attribute :production_companies, :integer
  attribute :seasons, :string
  attribute :episode_count, :integer
  attribute :name, :string
  attribute :overview, :string
  attribute :poster_path, :string
  attribute :season_number, :string
  attribute :spoken_languages, :string
  attribute :status, :string
  attribute :tagline, :string
  attribute :type, :string
  attribute :vote_count, :integer
  attribute :production_countries, :string

  Netflix = "213"
  Hulu = "1772"
  Genre_Tension = "35"
  Genre_Chill = "10751|16"
  Genre_Exciting = "9648|10764|10759|10765"

  class << self
    def all(params)
      TmdbApi.all(params)
    end

    def like(params)
      TmdbApi.like(params)
    end

    def like_movies(params)
      TmdbApi.like_movies(params)
    end
  end
end
