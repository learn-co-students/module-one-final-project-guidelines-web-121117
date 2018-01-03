class Song < ActiveRecord::Base

  has_many :song_playlists
  has_many :playlists, through: :song_playlists

  def self.select_by(parameter, value)
    self.all.select do |song|
      song[parameter.to_sym] == value
    end
  end


end
