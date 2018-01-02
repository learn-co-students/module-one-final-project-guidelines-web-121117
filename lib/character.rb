class Character < ActiveRecord::Base
  has_many :allegiences
  has_many :houses, through: :allegiences
end
