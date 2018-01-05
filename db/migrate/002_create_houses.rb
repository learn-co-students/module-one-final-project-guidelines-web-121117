class CreateHouses < ActiveRecord::Migration[4.2]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :url
    end
  end
end
