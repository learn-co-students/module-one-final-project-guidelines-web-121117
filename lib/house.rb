class House < ActiveRecord::Base
  has_many :allegiences
  has_many :characters, through: :allegiences
end
