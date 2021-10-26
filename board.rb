# frozen_string_literal: true

# TODO: Documentation Here
class Board
  attr_accessor :guess, :password

  def initialize
    super
    @guess = []
    @password = random_password
    print_password
  end

  public

  def same?
    @password == @guess
  end

  def check_position_and_color
    reds = []
    (0..3).each do |i|
      reds += ['reds'] if @password[i] == @guess[i]
    end
    reds
  end

  def check_color_without_position
    whites = []
    (0..3).each do |i|
      @password.map { |x| x != @password[1] }
    end
  end

  def random_password
    [(rand * 6).to_i] + [(rand * 6).to_i] + [(rand * 6).to_i] +
      [(rand * 6).to_i]
  end

  def take_user_guess
    @guess = []
    (1..4).each do |i|
      puts "please input guess #{i}"
      @guess += [gets.chomp.to_i]
    end
  end

  def print_password
    p "password #{@password}"
  end

  def to_color(num)
    case num + 1
    when 1 then 'red'
    when 2 then 'green'
    when 3 then 'yellow'
    when 4 then 'blue'
    when 5 then 'purple'
    when 6 then 'teal'
    else 'white'
    end
  end
end
