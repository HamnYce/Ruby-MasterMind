# frozen_string_literal: true

require_relative 'board'

# Creates board item, controls board state and stops if an end state is reached
# end state: win state || lose state
# win state: @board.win? == true
# lose state: turn_counter == 12

class Driver
  attr_accessor :board

  def initialize
    @board = Board.new
    puts 'Password has been set'
  end

  def game_loop
    (1..12).each do |i|
      break if end_game?

      puts "turn count: #{i}"

      p @board.whites.to_s unless @board.whites_empty?
      p @board.reds.to_s unless @board.reds_empty?
      @board.take_user_guess
    end

# TODO: func output_endmessage(boolean won)
    puts 'You got it!' if end_game?
    puts 'Darn Almost There!' unless end_game?
  end

  def end_game?
    return true if @board.win?

    false
  end
end
