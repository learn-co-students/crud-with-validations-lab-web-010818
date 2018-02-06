class Song < ActiveRecord::Base
  validates_presence_of :title, :artist_name
  validates :released, inclusion: { in: [true, false] }
  validates :title, uniqueness: { scope: :release_year }
  validates :release_year, presence: true, if: :released
  validates :release_year, numericality: { less_than_or_equal_to: 2018 }, allow_nil: true
end
