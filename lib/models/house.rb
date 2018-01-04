class House < ActiveRecord::Base
  belongs_to :region
  belongs_to :current_lord, class_name: "Character"
  has_many :allegiances
  has_many :characters, through: :allegiances

end
