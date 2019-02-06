module ConnectFour
  class GameLogic
    attr_reader :board

    def initialize(board)
      @board = board
    end

    def draw?
      flat_board = board.grid.flatten
      flat_board.none? { |square| square.value == " " }
    end


  
  end
end