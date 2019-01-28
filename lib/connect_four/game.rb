require "player.rb"
require "board.rb"

class Game
  attr_accessor :player_1, :player_2, :board

  def initialize(name_1, name_2)
    @player_1 = Player.new(name_1, "\u2606")
    @player_2 = Player.new(name_2, "\u2605")
    @board = Board.new
  end
end