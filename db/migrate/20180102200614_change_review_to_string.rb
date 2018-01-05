class ChangeReviewToString < ActiveRecord::Migration[5.0]
  def change
    change_column :reviews, :review, :string
  end
end
