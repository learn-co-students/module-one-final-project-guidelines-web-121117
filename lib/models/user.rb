class User < ActiveRecord::Base
  has_many :user_drinks
  has_many :users, through: :user_drinks
end
