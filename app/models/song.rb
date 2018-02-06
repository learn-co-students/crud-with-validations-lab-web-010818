class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validate :already_dropped?
  validate :released?


  def already_dropped?
  already_dropped = []
  Song.all.each do |song|
    if song.release_year == self.release_year && song.artist_name == self.artist_name
      #Cannot be repeated by the same artist in the same year
      already_dropped << song.title
    end
  end
  errors.add(:title, "already released") if !already_dropped.empty?
  end


  def released?
    if self.released
      errors.add(:release_year, "must have release year") if self.release_year == nil
    elsif self.released
      errors.add(:release_year, "must be less than current year") if self.release_year > Time.new.year
    end
  end
end
