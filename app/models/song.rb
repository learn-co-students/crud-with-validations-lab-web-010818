require 'date'

class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  validate :valid_release_year?
  validate :valid_song_title?

  def valid_release_year?
    if !self.released && self.release_year.nil?
      true
    elsif self.released && self.release_year.nil?
      errors.add(:release_year, "if released, must have release year")
    elsif self.release_year > Date.today.year
      errors.add(:release_year, "cannot be future dated")
    end
  end

  def valid_song_title?
    if Song.find_by(title: self.title, artist_name: self.artist_name, release_year: self.release_year)
      errors.add(:title, "title cannot be repeated by the same artist in the same year")
    end
  end
end
