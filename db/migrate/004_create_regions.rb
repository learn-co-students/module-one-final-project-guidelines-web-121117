class CreateRegions < ActiveRecord::Migration[4.2]
  def change
    create_table :regions do |t|
      t.string :name
    end
  end
end
