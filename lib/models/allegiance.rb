class Allegiance < ActiveRecord::Base
  belongs_to :character
  belongs_to :house
end
