class Song < ActiveRecord::Base
  validate :is_title_existent_and_unique_this_year?
  validates :released, inclusion: { in: [true, false] }
  validate :is_it_released_in_the_past?
  validates :artist_name, presence: true

  def is_title_existent_and_unique_this_year?
    if title
      if !Song.where(["title = ? and release_year = ? and artist_name = ?", title, release_year, artist_name]).empty?
        # Song.where(title: title, release_year: release_year, artist_name: artist_name)
        errors.add(:title, "cannot be repeated by the same artist in the same year")
      end
    else
      errors.add(:title, "title must exist")
    end
  end

  def is_it_released_in_the_past?
    if released && release_year
      if release_year > Time.now.year
        errors.add(:release_year, "release year must be in the past")
      end
    elsif released && !release_year
      errors.add(:release_year, "release year must exist")
    end
  end
end
