# frozen_string_literal: true

# controls number of turns, responsible for looping through turn, gives
# player feedback on board state, takes user input (guess), passes user input
# to Board class
class Driver
  def initialize
    @board = Board.new
    super
  end

  def print_choice
    puts "1 for red\n2 for green\n3 for yellow"
    puts "4 for blue\n5 for magenta\n6 for teal"
  end

  def color_converter(color_number)
    case color_number
    when 1 then 'red'
    when 2 then 'green'
    when 3 then 'yellow'
    when 4 then 'blue'
    when 5 then 'magenta'
    when 6 then 'teal'
    else 'invalid number'
    end
  end

  def atos_with_separator(arr, separator)
    s = arr[0].to_s
    (1..(arr.length - 1)).each do |i|
      s += "#{separator}#{arr[i]}"
    end
    s
  end

  def take_user_guess
    guess = []
    (1..4).each do |i|
      puts "position #{i}"
      print_choice
      guess.append(color_converter(gets.chomp.to_i))
    end
    guess
  end

  def game_loop
    take_user_guess until game_won?
  end

  def game_won?
    return 'guess is right!' if check_for_red_white(guess, password) == true

    puts 'you got mail'
    false
  end
end
