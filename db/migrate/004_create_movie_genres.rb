class CreateMovieGenres < ActiveRecord::Migration
  def change
    create_table :movie_genres do |mg|
      mg.references :movie
      mg.references :genre
    end
  end
end
