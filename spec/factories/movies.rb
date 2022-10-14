FactoryBot.define do
  factory :movie do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "name_#{n}" }
    sequence(:overview) { |n| "overview_#{n}" }
    poster_path { 'goKUd5y4lHU3qkW0XKKxmNSNcem.jpg' }
    #backdrop_path { 'goKUd5y4lHU3qkW0XKKxmNSNcem.jpg' }
    sequence(:first_air_date) { |n| "first_air_date_#{n}" }
    sequence(:genre_ids) { |n| n }
    sequence(:origin_country) { |n| "origin_country_#{n}" }
    sequence(:original_language) { |n| "original_language_#{n}" }
    sequence(:original_name) { |n| "original_name_#{n}" }
    sequence(:popularity) { |n| n }
    sequence(:vote_average) { |n| n }
    sequence(:vote_count) { |n| n }
  end
end
