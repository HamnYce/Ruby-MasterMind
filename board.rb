# frozen_string_literal: true

# TODO: Documentation Here
class Board
  # TODO: Remove accessors
  attr_accessor :guess, :password, :reds, :whites

  def initialize(is_computer_password)
    @password = (is_computer_password ? random_password : user_password)
    puts 'Password has been set'
    @guess = random_password if is_computer_password
    @guess = []
    @reds = []
    @whites = []
    # puts "password: + #{@password}"
  end

  public

  def win?
    return true if same?

    @reds = []
    @whites = []
    check_red_and_white
    false
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
      reds << 'RED'
    end
  end

  def check_white(guess, password, whites)
    (0..3).reverse_each do |i|
      (0..3).reverse_each do |j|
        next if guess[i].nil? || password[j].nil?
        next unless guess[i] == password[j]

        guess.delete_at(i)
        password.delete_at(j)
        whites << 'WHITE'
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

  def whites_empty?
    @whites.empty?
  end

  def reds_empty?
    @reds.empty?
  end

  def computer_solve
    (puts 'game end' or return) if win?

    (0..3).each do |i|
      @guess[i] = rand_int(6) unless @guess[i] == @password[i]
    end
    puts "coomputer guess: #{@guess.to_s}"
  end

  private

  def same?
    @password == @guess
  end

  def random_password
    pass = []
    (0..3).each do |_i|
      pass << (rand * 6).to_i + 1
    end
    pass
  end

  def user_password
    arr = []
    (1..4).each do |i|
      puts "enter value for position: #{i}"
      arr << gets.to_i
    end
    arr
  end

  

  # Random integer in range [1,bound]
  def rand_int(bound)
    (rand * bound).to_i + 1
  end
end
