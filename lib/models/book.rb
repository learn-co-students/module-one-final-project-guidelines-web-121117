class Book < ActiveRecord::Base
  has_many :character_books
  has_many :characters, through: :character_books
end
