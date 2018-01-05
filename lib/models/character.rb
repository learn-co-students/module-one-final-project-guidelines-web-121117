class Character < ActiveRecord::Base
  has_many :allegiances
  has_many :character_books
  has_many :character_seasons
  has_many :houses, through: :allegiances
  has_many :books, through: :character_books
  has_many :seasons, through: :character_seasons

end
