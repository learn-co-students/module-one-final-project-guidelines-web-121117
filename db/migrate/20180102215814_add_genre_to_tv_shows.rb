class AddGenreToTvShows < ActiveRecord::Migration[5.0]
  def change
    add_column :tv_shows, :genre, :string
  end
end
