class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year,
    message: "cannot release the same song twice in a year"}

  validates :release_year, presence: true, if: :released
  validate :release_year_cannot_be_in_future

  def release_year_cannot_be_in_future
    if release_year.to_i > Time.current.year
      errors.add(:release_year, "cannot be in the future")
    end
  end

end
