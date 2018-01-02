class House < ActiveRecord::Base
  has_many :allegiances
  has_many :characters, through: :allegiances
end
