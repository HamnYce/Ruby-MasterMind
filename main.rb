# frozen_string_literal: true

require_relative 'driver'

game = Driver.new

p game.board.password

game.game_loop


# TODO: decide on code win condition,
#         create loop that runs for either (12 times || (condition))
#         win condition: 4 reds in array, boolean released from
#         take_in_reds_whites
