class List < ApplicationRecord
  has_many :bookmarks
  has_many :movies, through: :bookmarks, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end

# List
#   has a name
#   name cannot be blank (FAILED - 3)
#   name is unique (FAILED - 4)
#   has many bookmarks
#   has many movies (FAILED - 5)
#   should destroy child saved movies when destroying self (FAILED - 6)
