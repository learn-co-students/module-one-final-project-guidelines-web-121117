class CreateCharacterBooks < ActiveRecord::Migration[4.2]
  def change
    create_table :character_books do |t|
      t.integer :book_id
      t.integer :character_id
    end
  end
end
