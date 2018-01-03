class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |a|
      a.string :name
    end
  end
end
