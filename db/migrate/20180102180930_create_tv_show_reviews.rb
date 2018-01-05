class CreateTvShowReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :tv_show_reviews do |t|
      t.integer :review_id
      t.integer :tv_show_id
    end
  end
end
