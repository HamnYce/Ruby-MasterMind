# frozen_string_literal: true

# TODO: Documentation Here
class Board
# TODO: Remove accessors for everything
  attr_accessor :guess, :password, :reds, :whites

  def initialize
    super
    @guess = []
    @password = random_password
    @reds = []
    @whites = []
    print_password
  end

  public

  def whites_empty?
    @whites.empty?
  end

  def reds_empty?
    @reds.empty?
  end

  def win?
    return true if same?

    @reds = []
    @whites = []
    check_red_and_white
    false
  end

  def same?
    @password == @guess
  end

  def check_red_and_white
    guess_t = Array.new(@guess)
    password_t = Array.new(@password)

    check_red(guess_t, password_t, @reds)
    check_white(guess_t, password_t, @whites)
  end

  def check_red(guess, password, reds)
    (0..3).reverse_each do |i|
      next unless guess[i] == password[i]

      guess.delete_at i
      password.delete_at i
      reds << 'red'
    end
  end

  def check_white(guess, password, whites)
    (0..3).reverse_each do |i|
      (0..3).reverse_each do |j|
        next if guess[i].nil? || password[j].nil?
        next unless guess[i] == password[j]

        guess.delete_at(i)
        password.delete_at(j)
        whites << 'white'
      end
    end
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

  private

  def random_password
    pass = []
    (0..3).each do |_i|
      pass << (rand * 6).to_i + 1
    end
    pass
  end
end
