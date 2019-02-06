module ConnectFour
  class Player
    attr_reader :name, :marker

    def initialize(input)
      @name = input[:name]
      @marker = input[:marker]
    end

    def drop_token(board, col)
      board.add_token(col, marker)
    end

  end
end