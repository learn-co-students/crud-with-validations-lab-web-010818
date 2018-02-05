class Song < ActiveRecord::Base
  validates_with SongValidator
  validates :title, presence: true
  validates :artist_name, presence: true
end
