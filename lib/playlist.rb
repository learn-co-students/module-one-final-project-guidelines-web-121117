class Playlist < ActiveRecord::Base

  has_many :song_playlists
  has_many :songs, through: :song_playlists

  def self.make_new_from(name, parameter, value)
    feature_hash = {name: name, tempo: nil, key: nil, mode: nil, time_signature: nil, danceability: nil, valence: nil, acousticness: nil, energy: nil, instrumentalness: nil}
    feature_hash[parameter.to_sym] = value
    new_playlist = self.create(feature_hash)
    relevant_songs = Song.select_by(parameter, value)
    relevant_songs.each do |song|
      new_playlist.songs << song
    end
    self
  end

  def self.find_by_trait(parameter, value=true)
    Playlist.all.select do |playlist|
      playlist[parameter.to_sym] == value
    end
  end

  def print_songs
    self.songs.each_with_index do |song, idx|
      puts "#{idx + 1}. #{song.name} - #{song.artists} - Spotify Id: spotify:song:#{song.spotify_id}"
    end
  end
end








# if SongPlaylist.find_by(song_id: song.id, playlist_id: self.id)
#   puts "This song is already in your playlist"
# else
#   new_playlist.songs << song
# end
