class AddUrlToBooks < ActiveRecord::Migration[4.2]
  def change
    add_column :books, :url, :string
  end
end
