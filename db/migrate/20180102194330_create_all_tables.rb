class CreateAllTables < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string  :name
      t.float :tempo
      t.integer :key
      t.integer :mode
      t.integer :time_signature
      t.float :danceability
      t.float :valence
      t.float :acousticness
      t.float :energy
      t.float :instrumentalness
    end

    create_table :playlists do |t|
      t.string  :name
    end

    create_table :song_playlists do |t|
      t.integer :song_id
      t.integer :playlist_id
    end

  end
end
