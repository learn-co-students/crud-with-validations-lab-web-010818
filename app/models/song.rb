class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: { in: [ true, false ] }
  # validates :release_year,
  # inclusion: { in: 1900..Date.today.year },
  # format: {
  #   with: /(19|20)\d{2}/i,
  #   message: "should be a four-digit year"
  # }

  validates :artist_name, presence: true
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
    less_than_or_equal_to: Date.today.year
   }
 end

 def released?
   released
 end




end
