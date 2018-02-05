class SongValidator < ActiveModel::Validator
  def validate(record)
    if !record.title.is_a? String
      record.errors[:base] << "Title must be a string"
    end

    if Song.find_by(title: record.title, artist_name: record.artist_name, release_year: record.release_year)
      record.errors[:base] << "Can't have same name, artist, and year as another song"
    end

    if !(record.released == true || record.released == false)
      record.errors[:base] << "Released must be true or false"
    end

    if record.released == true && record.release_year.nil?
      record.errors[:base] << "Release year is required for a released song"
    end

    if record.release_year.to_i > Date.today.year.to_i
      record.errors[:base] << "Release year must be less than or equal to current year"
    end
  end
end
