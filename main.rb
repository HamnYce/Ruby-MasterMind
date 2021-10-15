# frozen_string_literal: false

password= []
guess = []

# TODO: use print method to make the array printing look good
# template for guess/password is
# color1|color2|color3|color4

# driver
def print_choice
  puts "1 for red\n2 for green\n3 for yellow"
  puts "4 for blue\n5 for magenta\n6 for teal"
end

# driver
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

# driver
def take_user_guess
  guess = []
  (1..4).each do |i|
    puts "position #{i}"
    print_choice
    guess.append(color_converter(gets.chomp.to_i))
  end
  guess
end


# board
def create_random_password
  password = []
  (1..4).each do |i|
    # random number between 1 and 6
    random = (rand * 6 + 1).to_i
    password.append(color_converter(random))
  end
  password
end

def check_for_reds(solution, password)
  num_of_red = []
  deletion_indexes = []
  (0..3).each do |i|
    if solution[i] == password[i]
      num_of_red.append('red')
      deletion_indexes.append(i)
    end
  end
  # variables shift with each delete, use reverse to combat
  deletion_indexes.reverse_each do |i|
    solution.delete_at(i)
    password.delete_at(i)
  end
  num_of_red
end

def check_for_whites(solution, password)
  num_of_whites = []
  deletion_indexes = []
  (0..(solution.size - 1)).each do |i|
    if password.include?(solution[i])
      num_of_whites.append('white')
      deletion_indexes.append(i)
    end
  end
  deletion_indexes.reverse_each do |i|
    solution.delete_at(i)
  end
  num_of_whites
end

def check_for_red_white(solution, password)
  return true if solution == password

  temp_solution = Array.new(solution)
  temp_password = Array.new(password)

  check_for_reds(temp_solution, temp_password) + check_for_whites(temp_solution,
                                                                  temp_password)
end

# board
def print_code(arr)
  puts "#{arr[0]}|#{arr[1]}|#{arr[2]}|#{arr[3]}"
end

# driver
def game_won?(guess, password)
  return 'guess is right!' if check_for_red_white(guess, password) == true

  puts "you got mail"
  false
end

def game_loop
  take_user_guess until game_won?
end



password = create_random_password
p "password #{password}"
guess = take_user_guess
p "guess #{guess}"
until game_won?(guess, password)
  guess = take_user_guess
  p "guess #{guess}"
end
p "RED/WHITE #{check_for_red_white(guess, password)}"
p game_won?(guess, password)
