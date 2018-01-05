class CreateReviewsTwo < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :review
      t.integer :user_id
      t.integer :tv_show_id
    end
  end
end
