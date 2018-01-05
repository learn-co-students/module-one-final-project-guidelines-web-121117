module HelperMethods

  def main_menu
    CommandLineInterface.new.main_menu
  end

  def exit_program
    CommandLineInterface.new.exit
  end

  def rainbowize(string)
    words = string.split
    colors = [:light_red, :light_yellow, :light_green, :light_blue, :magenta, :light_magenta]
    words.map do |word|
      word.chars.map.with_index {|letter, idx| letter.colorize(:mode=>:bold, :color=>colors[idx % colors.count])}.join("")
    end.join(" ")
  end


end
