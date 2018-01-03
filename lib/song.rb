class Song < ActiveRecord::Base

  has_many :song_playlists
  has_many :playlists, through: :song_playlists

  def self.select_by(parameter, value)
    if value.is_a?(Float)
      self.all.select do |song|
        song[parameter.to_sym] >= value - 0.05 && song[parameter.to_sym] <= value + 0.05
      end
    else
      self.all.select do |song|
        song[parameter.to_sym] == value
      end
    end
  end


end
