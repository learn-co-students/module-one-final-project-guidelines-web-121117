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

  ########## MENUS

  def main_menu
    puts "What would you like to do?"
    puts "1. Create New Playlist"
    puts "2. View Playlists"
    puts "3. Delete a Playlist"
    puts "4. Find Playlists by Song"
    puts "5. Exit"
    user_input = get_user_input_main_menu
    if user_input == 1
      greet
      create_menu
    elsif user_input == 2
      greet
      view_menu
    elsif user_input == 3
      greet
      delete_menu
    elsif user_input == 4
      greet
      find_by_song_menu
    elsif user_input == 5
      return
    end
  end

  def create_menu
    print "Please enter a name for your new playlist (or M for Main Menu): "
    name = get_string
    if name == 'M' || name == 'm'
      greet
      main_menu
      return nil
    else
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
        clear_screen
        greet
        if new_playlist.songs.length == 0
          puts "There are no songs in #{new_playlist.name}"
          sleep(1.5)
          clear_screen
          greet
          main_menu
        else
        print_songs_from_playlist_name(new_playlist)
        end
    end
  end

  def view_menu
    puts "View playlists based on which parameter? ([A]ll | [M]ain Menu | [Q]uit)"
    print_categories
    input = gets.chomp
    if input == 'A' || input == 'a'
      greet
      relevant_playlists = Playlist.all
      make_playlist_table(relevant_playlists)
      selected_playlist = user_select_playlist
      if selected_playlist == "M"
        greet
        main_menu
      elsif selected_playlist == "Q"
        return
      else
        print_songs_from_playlist_name(selected_playlist)
      end
    elsif input == 'M' || input == 'm'
      greet
      main_menu
    elsif input == 'Q' || input == 'q'
      return
    elsif input.to_i > 0 && input.to_i < 10
      greet
      idx = input.to_i - 1
      parameter = CATEGORIES[idx]
      playlist_table_data = get_data_for_relevant_playlist(parameter)
      if playlist_table_data == nil
        print_blank_lines(5)
        indent(30)
        puts "No #{parameter} playlists exist! Why not make one!" + "   ｢(ﾟﾍﾟ)"
        sleep(3)
        greet
        main_menu
      else
        make_playlist_table(playlist_table_data)
        selected_playlist = user_select_playlist
        if selected_playlist == "M"
          greet
          main_menu
        elsif selected_playlist == "Q"
          return
        else
          print_songs_from_playlist_name(selected_playlist)
        end
      end
    else
      puts "Please enter a valid choice!"
      view_menu
    end
  end

  def find_by_song_menu
    relevant_playlists = []
    until relevant_playlists.length != 0
      print "Please enter song title to search for (M for Main menu or Q to quit): "
      song_name = gets.chomp
      song_instance = Song.find_by_name(song_name)
      relevant_playlists = Playlist.find_by_song(song_instance)
    end
    make_playlist_table(relevant_playlists)
    selected_playlist = user_select_playlist
    if selected_playlist == "M"
      greet
      main_menu
    elsif selected_playlist == "Q"
      return
    else
      print_songs_from_playlist_name(selected_playlist)
    end
  end

  def delete_menu
    Playlist.all.each_with_index do |playlist, idx|
      puts "#{idx + 1}. #{playlist.name}"
    end
    selected_playlist = nil
    until selected_playlist != nil
      print "Enter name of playlist to delete (or M for Main Menu): "
      name_input = get_string.titleize
      if name_input == 'M' || name_input == 'm'
        greet
        main_menu
        return nil
      else
        selected_playlist = Playlist.find_by(name: name_input)
      end
    end
    Playlist.destroy(selected_playlist.id)
    print_blank_lines(3)
    indent(40)
    puts "Playlist Deleted!" + "          (╯°□°）╯︵ ┻━┻"
    sleep(1)
    main_menu
  end

####### OUTPUT TABLES

  def print_table(table_data)
    greet
    table(border: true) do
      table_data.each do |row_array|
        row do
          column(row_array[:index], width: 3)
          column(row_array[:song_name], width: 40, color: 'green')
          column(row_array[:song_artists], width: 40, color: 'cyan')
          column(row_array[:spotify_id], width: 23, color: 'green')
        end
      end
    end
  end

  def make_playlist_table(playlist_table_data)
    table(border: true) do
      playlist_table_data.each do |row_array|
        row do
          column(row_array[:index], width: 3)
          column(row_array[:name], width: 30, color: 'green')
          column(row_array[:parameter], width: 20, color: 'white')
          column(row_array[:parameter_value], width: 20, color: 'green')
        end
      end
    end
  end

  def print_songs_from_playlist_name(selected_playlist)
    table_data = selected_playlist.create_songs_table
    print_table(table_data)
    song_choice = get_song_choice_from_user(table_data)
    open_song_in_web(song_choice)
  end

  def print_categories
    counter = 1
    CATEGORIES.each do |category|
      puts "#{counter}. #{category}"
      counter += 1
    end
  end

################## MISC

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

  def get_data_for_relevant_playlist(parameter)
    relevant_playlists = Playlist.where("#{parameter} IS NOT null")
    if relevant_playlists.length == 0
      return nil
    else
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
  end

  def open_song_in_web(song_array)
    if song_array
      Launchy.open("https://open.spotify.com/track/#{song_array[:spotify_id]}")
      return true
    else
      return false
    end
  end

############# GET USER INPUT

  def get_user_input_main_menu
    input = gets.chomp.to_i
    if input == 1 || input == 2 || input == 3 || input == 4
      input
    else
      puts "Please enter a valid choice!"
      get_user_input_main_menu
    end
  end

  def get_string
    input = gets.chomp.titleize
  end

  def get_user_input_for_playlist_parameter
    input = 0
    until input > 0 && input < 10
      input = gets.chomp.to_i
    end
    input -= 1
    CATEGORIES[input]
  end

  def gets_user_input_for_parameter_value(parameter)
    input = gets.chomp
    if parameter == :key
      until MUSICAL_KEYS.keys.include?(input)
        input = gets.chomp
      end
      input = translate_key_from_user_to_api(input.to_i)
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

  def user_select_playlist
    selected_playlist = nil
    until selected_playlist != nil
      print_blank_lines(2)
      indent(20)
      print "Enter playlist name to see songs (M for Main Menu or Q to quit): "
      name_input = get_string.titleize
      if name_input == "M" || name_input == "Q"
        return name_input
      else
        selected_playlist = Playlist.find_by(name: name_input)
      end
    end
    selected_playlist
  end

  def get_song_choice_from_user(table_data)
    input = 0
    until (input == "q" || input == "Q") || (input == "m" || input == "M") || (input > 0 && input <= table_data.length)
      print_blank_lines(2)
      print "Enter Song Number to open in your browser (M for Main Menu or Q to quit): "
      input = gets.chomp
      if input == "q" || input == "Q"
        return nil
      elsif input == "m" || input == "M"
        greet
        main_menu
      else
        input = input.to_i
      end
    end
    relevant_song = table_data.find { |song_array| song_array[:index] == input}
  end

##################### API TO ENGLISH TRANSLATION

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

#################### VISUAL

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
