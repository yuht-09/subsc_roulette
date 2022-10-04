class Like < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: { scope: :movie_id }
end
