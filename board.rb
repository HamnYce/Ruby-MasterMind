# frozen_string_literal: true

# Board class controls saves password state, compares the guess with the
# password returning true (if winner) or returns white/red pegs or nothing,
# creates a random password (cpu)
class Board
  attr_reader :password

  def initialize
    super()
    @guess = []
    @password = create_random_password
  end

  def create_random_password
    password = []
    (1..4).each do |i|
      random = (rand * 6 + 1).to_i
      password.append(color_converter(random))
    end
    password
  end

  def delete_at_indexes(deletion_indexes, array)
    deletion_indexes.each do |i|
      array.delete_at(i)
    end
  end

  def check_for_reds(solution, password)
    reds = [], deletion_indexes = []
    (0..(solution.length - 1)).each do |i|
      if solution[i] == password[i]
        reds.append('red')
        deletion_indexes.append(i)
      end
    end
    delete_at_indexes(deletion_indexes.reverse, password)
    delete_at_indexes(deletion_indexes.reverse, password)
    reds
  end

  def check_for_whites(solution, password)
    whites = [], deletion_indexes = []
    (0..(solution.size - 1)).each do |i|
      if password.include?(solution[i])
        whites.append('white')
        deletion_indexes.append(i)
      end
    end
    delete_at_indexes(deletion_indexes.reverse, solution)
    whites
  end

  def check_for_red_white
    t_guess = Array.new(@guess)
    t_password = Array.new(@password)

    check_for_reds(t_guess, t_password) + check_for_whites(t_guess, t_password)
  end

  def winner?(solution, password)
    return true if solution == password

    check_for_red_white
  end
end
