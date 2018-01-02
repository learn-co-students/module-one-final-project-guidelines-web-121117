class UpdateHouses < ActiveRecord::Migration[4.2]
  def change
    add_column :houses, :region_id, :integer
  end
end
