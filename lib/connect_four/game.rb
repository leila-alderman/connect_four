# The Game class brings together the Player, Board, and GameLogic classes to create the game flow.

class Game
  attr_accessor :player_1, :player_2, :board

  def initialize(input)
    
    @board = Board.new
  end
end
