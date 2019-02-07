# The Connect Four class brings together the Player, Board, and GameLogic classes to create the game flow.

require "./lib/connect_four/player"
require "./lib/connect_four/board"
require "./lib/connect_four/game_logic"

class ConnectFour
  attr_reader :board, :logic, :player_1, :player_2

  def initialize(name_1, name_2)
    @board = Board.new
    @logic = GameLogic.new(@board)
    @player_1 = Player.new({name: name_1, marker: "\u2606"})
    @player_2 = Player.new({name: name_2, marker: "\u2605"})
  end

  def play
    show_board
    
  end

  def show_board
    for i in 1..board.columns
      print "| #{i} " 
    end
    print "| \n"
    board.grid.each do |row|
      print row.map { |square| "| #{square.value} " }.join
      print "| \n"
    end
  end


end