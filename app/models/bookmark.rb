class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, presence: true, length: { minimum: 6 }
  validates :movie, :list, presence: true
  validates :movie_id, uniqueness: { scope: :list_id, message: 'This movie is already in the list !' }
end

# Bookmark
#   has a comment
#   comment cannot be shorter than 6 characters (FAILED - 1)
#   belongs to a movie
#   belongs to an list
#   movie cannot be blank
#   list cannot be blank
#   is unique for a given movie/list couple (FAILED - 2)
