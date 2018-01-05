class CreateTvShows < ActiveRecord::Migration[5.0]
  def change
    create_table :tv_shows do |t|
      t.string :name
      t.integer :rating
      t.string :status
    end
  end
end
