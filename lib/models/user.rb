class User < ActiveRecord::Base
  has_many :reviews
  has_many :tv_shows, through: :reviews
end
