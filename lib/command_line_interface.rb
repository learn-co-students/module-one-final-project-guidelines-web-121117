require 'command_line_reporter'

class CommandLineInterface

  include CommandLineReporter

  CATEGORIES = [:tempo, :key, :mode, :time_signature, :danceability, :valence, :acousticness, :energy, :instrumentalness]

  MUSICAL_KEYS = {"C" => 0, "C\#" => 1, "Db" => 1, "D" => 2, "D\#" => 3, "Eb" => 3, "E" => 4, "F" => 5, "F\#" => 6, "Gb" => 6, "G" => 7, "G\#" => 8, "Ab" => 8, "A" => 9, "A\#" => 10, "Bb" => 10, "B" => 11}

  def run
    greet
    logo
    sleep(3)
    greet
    main_menu


    goodbye
  end

  def greet
    clear_screen
    a = Artii::Base.new
    puts Rainbow(a.asciify('               ( ( (   Playlist Creator')).green.bright
  end

  def goodbye
    print_blank_lines(3)
    indent(40)
    puts "(" + Rainbow("づ").blink + "｡◕ ‿ ◕｡)" + Rainbow("づ  ♬ ♫ ♬ ♩ ♫ ♬ ♩ ").blink
    print_blank_lines(5)
  end

  def main_menu
    puts "What would you like to do?"
    puts "1. Create New Playlist"
    puts "2. View Playlists"
    puts "3. Delete a Playlist"
    puts "4. Exit"
    user_input = get_user_input_main_menu
    if user_input == 1
      greet
      print "Please enter a name for your new playlist: "
      name = get_string
      puts "Please choose a parameter from the list to create #{name}:"
      print_categories
      parameter = get_user_input_for_playlist_parameter
      give_parameter_specs(parameter)
      value = gets_user_input_for_parameter_value(parameter)
      new_playlist = Playlist.make_new_from(name, parameter, value)
      print_blank_lines(2)
      indent(40)
      puts "Playlist Created!" + "       ♬ ♫  ᕦ(ò_óˇ)ᕤ ♬ ♫ "
      sleep(1)
      greet
      print_songs_from_playlist_name(new_playlist)
    elsif user_input == 2
      greet
      view_menu
    elsif user_input == 3
      greet
      delete_menu
    elsif user_input == 4
      return
    end
  end



  def view_menu
    puts "View playlists based on which parameter? ([A]ll or [Q]uit)"
    print_categories
    input = gets.chomp
    if input == 'A' || input == 'a'
      greet
      relevant_playlists = Playlist.all
      make_playlist_table(relevant_playlists)
      selected_playlist = user_select_playlist
      print_songs_from_playlist_name(selected_playlist)
    elsif input == 'Q' || input == 'q'
      return
    elsif input.to_i > 0 && input.to_i < 10
      greet
      idx = input.to_i - 1
      parameter = CATEGORIES[idx]
      playlist_table_data = get_data_for_relevant_playlist(parameter)
        make_playlist_table(playlist_table_data)
        selected_playlist = user_select_playlist
        print_songs_from_playlist_name(selected_playlist)
    else
      puts "Please enter a valid choice!"
      view_menu
    end
  end

  def get_data_for_relevant_playlist(parameter)
    relevant_playlists = Playlist.where("#{parameter} IS NOT null")
    playlist_table_data = []
    if parameter == :key
      relevant_playlists.each_with_index do |playlist, idx|
        translated_parameter_value = translate_key_from_api_to_user(playlist[parameter])
        playlist_table_data << {index: idx + 1, name: playlist.name, parameter: parameter, parameter_value: translated_parameter_value}
      end
    elsif parameter == :mode
      relevant_playlists.each_with_index do |playlist, idx|
        translated_parameter_value = translate_mode_from_api_to_user(playlist[parameter])
        playlist_table_data << {index: idx + 1, name: playlist.name, parameter: parameter, parameter_value: translated_parameter_value}
      end
    else
      relevant_playlists.each_with_index do |playlist, idx|
        translated_parameter_value = playlist[parameter]
        playlist_table_data << {index: idx + 1, name: playlist.name, parameter: parameter, parameter_value: translated_parameter_value}
      end
    end
    playlist_table_data
  end



  def make_playlist_table(playlist_table_data)
    table(border: true) do
      playlist_table_data.each do |row_array|
        row do
          column(row_array[:index], width: 3)
          column(row_array[:name], width: 40, color: 'green')
          column(row_array[:parameter], width: 40, color: 'white')
          column(row_array[:parameter_value], width: 40, color: 'green')
        end
      end
    end
  end

  def delete_menu
    Playlist.all.each_with_index do |playlist, idx|
      puts "#{idx + 1}. #{playlist.name}"
    end
    selected_playlist = nil
    until selected_playlist != nil
      print "Enter name of playlist to delete: "
      name_input = get_string.titleize
      selected_playlist = Playlist.find_by(name: name_input)
    end
      Playlist.destroy(selected_playlist.id)
      puts "Playlist Deleted!" + "(╯°□°）╯︵ ┻━┻"
  end

  def user_select_playlist
    selected_playlist = nil
    until selected_playlist != nil
      print_blank_lines(2)
      indent(20)
      print "Enter playlist name to see songs: "
      name_input = get_string.titleize
      selected_playlist = Playlist.find_by(name: name_input)
    end
    selected_playlist
  end

  def print_songs_from_playlist_name(selected_playlist)
    table_data = selected_playlist.create_songs_table
    print_table(table_data)
    song_choice = get_song_choice_from_user(table_data)
    song_choice ? open_song_in_web(song_choice) : return
  end

  def get_song_choice_from_user(table_data)
    input = 0
    until (input > 0 && input <= table_data.length) || (input == "q" or input == "Q")
      print_blank_lines(2)
      print "Enter Song Number to open in your browser (or Q to quit): "
      input = gets.chomp
      if input == "q" || input == "Q"
        return nil
      else
        input = input.to_i
      end
    end
    relevant_song = table_data.find { |song_array| song_array[:index] == input}
  end

  def open_song_in_web(song_array)
    Launchy.open("https://open.spotify.com/track/#{song_array[:spotify_id]}")
  end

  def get_string
    input = gets.chomp.titleize
  end

  def print_categories
    counter = 1
    CATEGORIES.each do |category|
      puts "#{counter}. #{category}"
      counter += 1
    end
  end

  def get_user_input_main_menu
    input = gets.chomp.to_i
    if input == 1 || input == 2 || input == 3 || input == 4
      input
    else
      puts "Please enter a valid choice!"
      get_user_input_main_menu
    end
  end

  def get_user_input_for_playlist_parameter
    input = 0
    until input > 0 && input < 10
      input = gets.chomp.to_i
    end
    input -= 1
    CATEGORIES[input]
  end

  def give_parameter_specs(parameter)
    if parameter == :key
      puts "Please enter desired key(example: C, Bb, A\#)"
    elsif parameter == :mode
      puts "Please enter major or minor."
    elsif parameter == :time_signature
      puts "Please enter number of beats per measure (3 - 7)"
    elsif parameter == :tempo
      puts "Please enter BPM"
    else
      puts "Please enter a decimal between 0.0 - 1.0"
    end
  end

  def gets_user_input_for_parameter_value(parameter)
    input = gets.chomp
    if parameter == :key
      input = translate_key_from_user_to_api(input)
      until input >= 0 && input < 12
        input = gets.chomp.to_i
      end
    elsif parameter == :tempo
      input = input.to_f
      until input > 0.0 && input < 200.0
        input = gets.chomp.to_f
      end
    elsif parameter == :mode
      input = translate_mode_from_user_to_api(input)
      until (input == 1 || input == 0)
        # 0 is minor, 1 is major
        input = gets.chomp.to_i
      end
    elsif parameter == :time_signature
      input = input.to_i
      until input >= 0 && input <= 7
        input = gets.chomp.to_i
      end
    else
      input = input.to_f
      until input >= 0.0 && input <= 1.0
        input = gets.chomp.to_i
      end
    end
    input
  end

  def translate_key_from_api_to_user(input)
    MUSICAL_KEYS.invert[input]
  end

  def translate_key_from_user_to_api(input)
    MUSICAL_KEYS[input]
  end

  def translate_mode_from_api_to_user(input)
    if input == 1
      "major"
    else
      "minor"
    end
  end

  def translate_mode_from_user_to_api(input)
    if input.downcase == "major"
      1
    else
      0
    end
  end

  def clear_screen
    system ("clear")
  end

  def print_blank_lines(x)
    x.times {puts ""}
  end

  def indent(x)
    x.times {print " "}
  end

  def double_space
    self.print_blank_lines(1)
    self.indent(40)
  end

  def print_table(table_data)
    greet
    table(border: true) do
      table_data.each do |row_array|
        # binding.pry
        row do
          column(row_array[:index], width: 3)
          column(row_array[:song_name], width: 40, color: 'green')
          column(row_array[:song_artists], width: 40, color: 'cyan')
          column(row_array[:spotify_id], width: 23, color: 'green')
        end
      end
    end
  end



  def logo
    print_blank_lines(5)
    indent(40)
    puts "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
    indent(40)
    puts "░░░░░░░░░░░░░░" + Rainbow("█████████████").green + "░░░░░░░░░░░░░░"
    indent(40)
    puts "░░░░░░░░░░" + Rainbow("█████████████████████").green + "░░░░░░░░░░"
    indent(40)
    puts "░░░░░░░░" + Rainbow("█████████████████████████").green + "░░░░░░░░"
    indent(40)
    puts "░░░░░░" + Rainbow("████████████▀▀▀▀▀████████████").green + "░░░░░░"
    indent(40)
    puts "░░░░░" + Rainbow("███████▀▀▔▔         ▔▔▀▀███████").green + "░░░░░"
    indent(40)
    puts "░░░░" + Rainbow("████▀▔   ▁▄▄▆▆██████▆▄▄▁   ▔▀████").green + "░░░░"
    indent(40)
    puts "░░░" + Rainbow("█████▄▄▆███████▀▀▀▀████████▆▄▄█████").green + "░░░"
    indent(40)
    puts "░░░" + Rainbow("█████████▀▀▔▔   ▁▁    ▔▔▀▀█████████").green + "░░░"
    indent(40)
    puts "░░░" + Rainbow("██████▔   ▁▄▄▆▆██████▆▄▄▁   ▔██████").green + "░░░"
    indent(40)
    puts "░░░░" + Rainbow("█████▆▆█████▀▀▔▔▔▔▀▀▀█████▆▆█████").green + "░░░░"
    indent(40)
    puts "░░░░░" + Rainbow("██████▀▔▔  ▁▁▄▆▆▆▄▄▁  ▔▔▀██████").green + "░░░░░"
    indent(40)
    puts "░░░░░░" + Rainbow("█████▄▄▆█████████████▆▄▄█████").green + "░░░░░░"
    indent(40)
    puts "░░░░░░░░" + Rainbow("█████████████████████████").green + "░░░░░░░░"
    indent(40)
    puts "░░░░░░░░░░" + Rainbow("█████████████████████").green + "░░░░░░░░░░"
    indent(40)
    puts "░░░░░░░░░░░░░░" + Rainbow("█████████████").green + "░░░░░░░░░░░░░░"
    indent(40)
    puts "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
  end
end
