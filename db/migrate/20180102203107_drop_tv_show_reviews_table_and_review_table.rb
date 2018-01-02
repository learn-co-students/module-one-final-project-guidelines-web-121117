class DropTvShowReviewsTableAndReviewTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :tv_show_reviews
    drop_table :reviews
  end
end
