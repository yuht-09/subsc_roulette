FactoryBot.define do
    factory :user do
      sequence(:name) { |n| "user_#{n}"}
      sequence(:email) { |n| "#{n}@gmail.com" }
      password              { "000000" }
      password_confirmation { "000000" }
    end
  end