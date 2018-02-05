class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :same_artist_same_year

  validates :released, inclusion: {in: [true,false]}

  validate :released_year_if_released

  validates :artist_name, presence: true

  def same_artist_same_year
    matching_songs = Song.select do |song|
      song.title == title && song.artist_name = artist_name && song.release_year == release_year
    end
    if matching_songs != []
      errors.add(:title, "song title, artist, and year cannot all match")
    end
  end

  def released_year_if_released
    if released && !release_year
      errors.add(:release_year, "released songs must have a release year")
    elsif release_year.to_i > Time.now.year
      errors.add(:release_year, "cannot be in the future")
    end
  end
end
