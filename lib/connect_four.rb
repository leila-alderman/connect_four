# The Connect Four class brings together the Player, Board, and GameLogic classes to create the game flow.

require "connect_four/player"
require "connect_four/board"
require "connect_four/game_logic"

class ConnectFour
  attr_reader :board, :logic, :player_1, :player_2

  def initialize(name_1, name_2)
    @board = Board.new
    @logic = GameLogic.new
    @player_1 = Player.new(name_1, "\u2606")
    @player_2 = Player.new(name_2, "\u2605")
  end

  def start_game
    
    
  end

end