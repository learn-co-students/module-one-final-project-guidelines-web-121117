class CharacterSeason < ActiveRecord::Base
  belongs_to :character
  belongs_to :season
end
