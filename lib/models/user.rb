class User < ActiveRecord::Base
  has_many :reviews
  has_many :tv_shows, through: :reviews

  def self.user_names
    self.all.map {|user| user.name}
  end
end
