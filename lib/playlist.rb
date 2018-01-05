



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
    new_playlist
  end

  def self.find_by_trait(parameter, value=true)
    Playlist.all.select do |playlist|
      playlist[parameter.to_sym] == value
    end
  end


  def self.find_by_song(song)
    self.all.select do |playlist|
      playlist.songs.include?(song)
    end
  end


  def create_songs_table
    table_data = []
    self.songs.each_with_index do |song, idx|
      table_data << {index: idx + 1, song_name: song.name, song_artists: song.artists, spotify_id: "#{song.spotify_id}"}
    end
    table_data
  end

end








# if SongPlaylist.find_by(song_id: song.id, playlist_id: self.id)
#   puts "This song is already in your playlist"
# else
#   new_playlist.songs << song
# end
