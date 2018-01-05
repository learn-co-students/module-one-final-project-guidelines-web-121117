class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |m|
      m.string :name
    end
  end
end
