require 'rest-client'
require 'json'
require 'pry'


tv_show_data = RestClient.get('http://api.tvmaze.com/search/shows?q=girls')
tv_show_array = JSON.parse(tv_show_data)

tv_show_array.each do |tv_show_element|
  name = tv_show_element["show"]["name"]
  rating = tv_show_element["show"]["rating"]["average"]
  status = tv_show_element["show"]["status"]

  TvShow.create(name: name, rating: rating, status: status)
end
