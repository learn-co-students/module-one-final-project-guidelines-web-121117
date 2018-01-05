class AddRatingCountToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :rating_count, :integer
  end
end
