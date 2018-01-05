class TvShow < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  def self.all_genres_array
    self.all.map {|show| show.genre}.uniq.compact
  end

  def self.all_tv_shows
    self.all.map{|show| show}
  end

  def self.list_all_tv_shows
    self.all.each.with_index(1) {|show, ind| puts "#{ind}".colorize(:light_red)+".#{show.name}"}
  end

  # test things I know to be true
  # self.all_show_names => more than one
  # => get an array
  # in that array we get strings
  # create a single show
  # call all_show_names
  # check for that specific
end
