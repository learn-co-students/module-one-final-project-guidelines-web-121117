class CommandLineInterface

  CATEGORIES = [:tempo, :key, :mode, :time_signature, :danceability, :valence, :acousticness, :energy, :instrumentalness]

  MUSICAL_KEYS = {"C" => 0, "C\#" => 1, "Db" => 1, "D" => 2, "D\#" => 3, "Eb" => 3, "E" => 4, "F" => 5, "F\#" => 6, "Gb" => 6, "G" => 7, "G\#" => 8, "Ab" => 8, "A" => 9, "A\#" => 10, "Bb" => 10, "B" => 11}

  def run
    greet
    main_menu


    goodbye
  end

  def greet
    a = Artii::Base.new
    puts a.asciify('Playlist Creator')
  end

  def goodbye
    puts "goodbye"
  end

  def main_menu
    puts "What would you like to do?"
    puts "1. Create New Playlist"
    puts "2. View Playlists"
    puts "3. Delete a Playlist"
    puts "4. Exit"
    user_input = get_user_input_main_menu
    if user_input == 1
      print "Please enter a name for your new playlist: "
      name = get_string
      puts "Please choose a parameter from the list to create #{name}:"
      print_categories
      parameter = get_user_input_for_playlist_parameter
      give_parameter_specs(parameter)
      value = gets_user_input_for_parameter_value(parameter)
      Playlist.make_new_from(name, parameter, value)
    elsif user_input == 2
      view_menu
    elsif user_input == 3

    elsif user_input == 4
      return
    end
  end

  def view_menu
    puts "View playlists based on which parameter? ([A]ll or [Q]uit)"
    print_categories
    input = gets.chomp
    if input == 'A'
      Playlist.all.each_with_index do |playlist, idx|
        puts "#{idx + 1}. #{playlist.name}"
      end
    elsif input == 'Q'
      return
    elsif input.to_i > 0 && input.to_i < 10
      idx = input.to_i - 1
      parameter = CATEGORIES[idx]
      relevant_playlists = Playlist.where(parameter.to_s)
      if parameter == :key
        relevant_playlists.each_with_index do |playlist, idx|
          transalated_parameter_value = translate_key_from_api_to_user(playlist[parameter])
          puts "#{idx + 1}. #{playlist.name} - #{parameter}: #{transalated_parameter_value}"
        end
      elsif parameter == :mode
        relevant_playlists.each_with_index do |playlist, idx|
          transalated_parameter_value = translate_mode_from_api_to_user(playlist[parameter])
          puts "#{idx + 1}. #{playlist.name} - #{parameter}: #{transalated_parameter_value}"
        end
      else
        relevant_playlists.each_with_index do |playlist, idx|
          puts "#{idx + 1}. #{playlist.name} - #{parameter}: #{playlist[parameter]}"
        end
      end
    else
      puts "Please enter a valid choice!"
      view_menu
    end
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
    if input.downcase = "major"
      1
    else
      0
    end
  end




end
