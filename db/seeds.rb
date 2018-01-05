require 'rest-client'
require 'json'
require 'pry'


tv_show_data = RestClient.get('http://api.tvmaze.com/shows')
tv_show_array = JSON.parse(tv_show_data)

tv_show_array.each do |tv_show_element|
  name = tv_show_element["name"]
  genre = tv_show_element["genres"][0]
  rating = tv_show_element["rating"]["average"]
  status = tv_show_element["status"]

  TvShow.create(name: name, genre: genre, rating: rating, status: status)
end
