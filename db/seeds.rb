require 'rest-client'
require 'JSON'
require 'yaml'
require_relative '../config/environment'


Song.destroy_all

keys = YAML.load_file('keys.yml')
auth_headers = keys['AUTH_HASH']

spotify_object = RestClient.get('https://api.spotify.com/v1/users/mautayro/playlists/0yXhEQ7kJDqRvuJGURY8Py/tracks', headers=auth_headers)

playlist_data = JSON.parse(spotify_object)

# song_ids = []
song_id_name_hash = {}
playlist_data["items"].each do |item|
  clean_song_id = item["track"]["uri"].split(":").last
  song_id_name_hash[clean_song_id] = item["track"]["name"]
  # song_ids << clean_song_id
end


song_ids_string = ""

song_id_name_hash.keys.each do |song_id|
  song_ids_string << "#{song_id},"
end

song_ids_string.chomp(',')


audio_feature_spotify_object = RestClient.get('https://api.spotify.com/v1/audio-features?ids=' + song_ids_string, headers=auth_headers)

audio_features_hash = JSON.parse(audio_feature_spotify_object)
audio_feature_objects = audio_features_hash["audio_features"]

audio_feature_objects.each do |song_object|
  name = song_id_name_hash[song_object["id"]]
  tempo = song_object["tempo"]
  key = song_object["key"]
  mode = song_object["mode"]
  time_signature = song_object["time_signature"]
  danceability = song_object["danceability"]
  valence = song_object["valence"]
  acousticness = song_object["acousticness"]
  energy = song_object["energy"]
  instrumentalness = song_object["instrumentalness"]

  Song.create(name: name, tempo: tempo, key: key, mode: mode, time_signature: time_signature, danceability: danceability, valence: valence, acousticness: acousticness, energy: energy, instrumentalness: instrumentalness)
end


# {"audio_features"=>[
#   {"danceability"=>0.225, "energy"=>0.537, "key"=>4, "loudness"=>-13.602, "mode"=>0, "speechiness"=>0.0422, "acousticness"=>0.981, "instrumentalness"=>0.875, "liveness"=>0.0922, "valence"=>0.591, "tempo"=>192.968, "type"=>"audio_features", "id"=>"3h64C58s1P6WsNu7ZMa0QY", "uri"=>"spotify:track:3h64C58s1P6WsNu7ZMa0QY", "track_href"=>"https://api.spotify.com/v1/tracks/3h64C58s1P6WsNu7ZMa0QY", "analysis_url"=>"https://api.spotify.com/v1/audio-analysis/3h64C58s1P6WsNu7ZMa0QY", "duration_ms"=>269093, "time_signature"=>3}
