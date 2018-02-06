class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: {in: [true,false]}
  validates :title, uniqueness: { scope: :release_year}
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year}, if: :released?
  validates :release_year, presence: true, if: :released?


  def released?
    self.released
  end

end
