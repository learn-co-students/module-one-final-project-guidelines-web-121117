class TvShow < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  #
  # def self.all_show_names
  #   TvShow.all.map {|show| show.name}
  # end



  # test things I know to be true
  # self.all_show_names => more than one
  # => get an array
  # in that array we get strings
  # create a single show
  # call all_show_names
  # check for that specific
end
