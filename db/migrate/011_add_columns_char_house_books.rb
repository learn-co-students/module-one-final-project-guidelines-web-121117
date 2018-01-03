class AddColumnsCharHouseBooks < ActiveRecord::Migration[4.2]
  def change
    add_column :characters, :gender, :string
    add_column :characters, :birth_date, :string
    add_column :characters, :death_date, :string
    add_column :characters, :alliases, :string
    add_column :characters, :actor, :string
    add_column :houses, :current_lord, :string
    add_column :books, :total_pages, :string
    add_column :books, :release_date, :string 
  end
end
