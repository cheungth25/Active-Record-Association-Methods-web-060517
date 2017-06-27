class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    Song.where(genre_id: self.id).size
  end

  def artist_count
    # return the number of artists associated with the genre
    song_array = Song.where(genre_id: self.id)
    song_array.map{|song|song[:artist_id]}.uniq.size
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    song_array = Song.where(genre_id: self.id)
    artist_ids = song_array.map{|song|song[:artist_id]}.uniq
    artist_ids.map { |artist_id| Artist.find(artist_id).name}
  end
end
