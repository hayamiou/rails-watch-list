class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end

# Movie
#   has a title and an overview
#   title is unique (FAILED - 7)
#   title cannot be blank (FAILED - 8)
#   overview cannot be blank (FAILED - 9)
#   has many bookmarks
#   should not be able to destroy self if has bookmarks children
