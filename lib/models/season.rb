class Season < ActiveRecord::Base
  has_many :character_seasons
  has_many :characters, through: :character_seasons
end
