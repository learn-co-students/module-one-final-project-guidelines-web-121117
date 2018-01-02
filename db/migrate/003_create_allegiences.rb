class CreateAllegiences < ActiveRecord::Migration[4.2]
  def change
    create_table :allegiences do |t|
      t.integer :character_id
      t.integer :house_id
    end
  end
end
