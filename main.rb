# frozen_string_literal: true

require_relative 'board'

b = Board.new

p b.password

b.take_user_guess

b.check_red_and_white

p b.guess
p b.password
p b.reds
p b.whites
