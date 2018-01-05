class ChangeHousesAddForeignId < ActiveRecord::Migration[4.2]
  def change
    remove_column :houses, :current_lord, :string
    add_column :houses, :current_lord_id, :integer
    add_foreign_key :houses, :characters, column: :current_lord_id
  end
end
