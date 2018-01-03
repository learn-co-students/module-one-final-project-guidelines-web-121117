class CommandLineInterface

  CATAGORIES = [:tempo, :key, :mode, :time_signature, :danceability, :valence, :acousticness, :energy, :instrumentalness]

  MUSICAL_KEYS = {"C" => 0, "C\#" => 1, "Db" => 1, "D" => 2, "D\#" => 3, "Eb" => 3, "E" => 4, "F" => 5, "F\#" => 6, "Gb" => 6, "G" => 7, "G\#" => 8, "Ab" => 8, "A" => 9, "A\#" => 10, "Bb" => 10, "B" => 11}

  def greet
    puts "Hello"
  end

  def goodbye
    puts "goodbye"
  end

  def get_user_input_for_playlist_parameter
    input = nil
    until CATAGORIES.include?(input)
      input = gets.chomp.downcase.to_sym
    end
    input
  end

  def gets_user_input_for_parameter_value(parameter)
    input = gets.chomp
    if parameter == :key
      until input >= 0 && input < 12 && input.is_a?(Integer)
        input = gets.chomp.to_i
      end
    elsif parameter == :mode
      until (input == 1 || input == 0) && input.is_a?(Integer)
        # 0 is minor, 1 is major
        input = gets.chomp.to_i
      end
    elsif parameter == :time_signature
      until input >= 0 && input <= 7 && input.is_a?(Integer)
        input = gets.chomp.to_i
      end
    else
      until input >= 0.0 && input <= 1.0 && input.is_a?(Float)
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
