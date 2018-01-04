class AddPlaylistCreationData < ActiveRecord::Migration[5.1]
  def change
    add_column :playlists, :tempo, :float
    add_column :playlists, :key, :integer
    add_column :playlists, :mode, :integer
    add_column :playlists, :time_signature, :integer
    add_column :playlists, :danceability, :float
    add_column :playlists, :valence, :float
    add_column :playlists, :acousticness, :float
    add_column :playlists, :energy, :float
    add_column :playlists, :instrumentalness, :float
  end
end
