# frozen_string_literal: true

# TODO: insert documentation here
class Board
  def initialize
    super()
    @available_colors = %w[blue green red yellow magenta teal]
    create_random_code
  end

  def check_answer(solution)
    # returns true if there is a winner, else returns the response
    return true if solution == @code

    @response.append(check_for_reds(solution))
    return true if @response.size == 4

    @response.append(check_for_whites(solution)) unless @response.size == 4
    @response
  end

  private

  def create_random_code
    @code = %w[blue red green yellow]
  end

  # checks for correct color at the correct position.
  # removes any correct placements from the solutions array and returns 'red'
  def check_for_reds(solution)
    num_of_red = []
    (1..4).each do |i|
      if solution[i] == @code[i]
        num_of_red.append('red')
        solution.delete_at(i)
      end
    end
    num_of_red
  end

  # checks for correct color and returns 'white' for each correct color
  def check_for_whites(solution)
    num_of_whites = []
    (1..solution.size).each do |i|
      if @code.include?(solution[i])
        num_of_whites.append('white')
        solution.delete_at(i)
      end
    end
    num_of_whites
  end

  public

  def random_color
    @available_colors.sample
  end
end
