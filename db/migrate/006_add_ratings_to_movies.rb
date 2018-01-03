class AddRatingsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :rating, :float
  end
end
