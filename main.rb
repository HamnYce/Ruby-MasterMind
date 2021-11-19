# frozen_string_literal: true

require_relative 'driver'

game = Driver.new

p game.board.password

game.game_loop