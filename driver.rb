# frozen_string_literal: true

require_relative 'board'

# Driver class: creates objects of board and processes the stages of the game
class Driver
  attr_accessor :board

  def initialize
    puts "MASTERMIND\nYou will have 12 guesses to get the password"
    puts 'The password contains 4 random numbers (potential duplicates)'
    puts 'the numbers range from 1 - 6 (inclusive)'
    puts 'You will get a red pin for each number with the right position and value'
    puts 'You will a white pin for each number with the right value but wrong position'
    puts "(a combination of white and red pins are allowed)\n-------------"
    is_computer_password = player_or_computer_password
    @board = Board.new(is_computer_password)
    (is_computer_password ? user_game_loop : computer_game_loop)
  end

  def player_or_computer_password
    puts "enter \n
          1 - to guess the password\n
          2 - to create the password (and the computer solves it)"

    return true if gets.to_i == 1

    false
  end

  def user_game_loop
    # TODO: make number of loops 12
    (1..2).each do |i|
      break if end_game?

      puts "turn count: #{i}"

      puts "\nguess response:" unless i == 1
      print_array(@board.reds) unless @board.reds_empty?
      print_array(@board.whites) unless @board.whites_empty?
      puts "\n\n"
      @board.take_user_guess
    end

    end_game_message
  end

  def computer_game_loop
    (1..12).each do |i|
      break if end_game?

      puts "turn count: #{i}"

      puts "\nguess response:" unless i == 1
      print_array(@board.reds) unless @board.reds_empty?
      print_array(@board.whites) unless @board.whites_empty?
      puts "\n\n"
      @board.computer_solve
    end

    end_game_message
  end

  private

  def print_array(arr)
    arr.each do |x|
      print "#{x} "
    end

  end

  def end_game_message
    puts 'You got it!' if end_game?
    puts 'Darn Almost There!' unless end_game?
  end

  def end_game?
    return true if @board.win?

    false
  end
end
