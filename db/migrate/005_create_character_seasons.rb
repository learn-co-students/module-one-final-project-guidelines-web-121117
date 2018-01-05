class CreateCharacterSeasons < ActiveRecord::Migration[4.2]
  def change
    create_table :character_seasons do |t|
      t.integer :season_id
      t.integer :character_id
    end
  end
end
