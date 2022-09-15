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

  class << self
    def all(params)
      TmdbApi.all(params)
    end
  end

end
