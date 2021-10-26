# frozen_string_literal: true

require_relative 'board'


guess = [1, 1, 1, 1]
password = [1, 2, 3, 4]
whites = []

(0..3).reverse_each do |i|
  (0..3).each do |j|
    next if i == j
    next unless guess[i] == password[j]

    guess.delete_at(i)
    password.delete_at(j)
    whites << 'white'
    next
  end
end

p whites

# b = Board.new

# until b.same?
#   b.take_user_guess
#   p b.check_position_and_color
# end
