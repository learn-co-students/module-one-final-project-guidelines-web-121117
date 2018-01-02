class House < ActiveRecord::Base
  belongs_to :region
  has_many :allegiances
  has_many :characters, through: :allegiances
end
