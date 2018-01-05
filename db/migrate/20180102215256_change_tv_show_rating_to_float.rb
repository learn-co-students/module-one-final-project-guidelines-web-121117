class ChangeTvShowRatingToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :tv_shows, :rating, :float
  end
end
