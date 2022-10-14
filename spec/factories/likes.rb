FactoryBot.define do
  factory :like do
    sequence(:user_id) { |n| n }
    sequence(:movie_id) { |n| n }
  end
end
