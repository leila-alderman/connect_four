module ConnectFour
  class Board
    attr_accessor :grid

    def initialize
      @grid = create_board
    end


    private
    def create_board
      columns = 7
      rows = 6

      grid = []
      for i in 1..rows
        row = []
        for j in 1..columns
          row.push(create_square(i,j))
        end
        grid.push(row)
      end
      add_connections(grid, columns, rows)
      return grid
    end

    def create_square(i, j)
      ConnectFour::Square.new({
        row: i,
        col: j
      })
    end

    def add_connections(grid, columns, rows)
      for i in 0..(rows-1)
        for j in 0..(columns-1)
          element = grid[i][j]
          element.left = grid[i][j-1]
          element.right = grid[i][j+1]
          element.top = grid [i-1] == nil ? nil : grid[i-1][j]
          element.bottom = grid [i+1] == nil ? nil : grid[i+1][j]
          element.up_left = grid[i-1] == nil ? nil : grid[i-1][j-1]
          element.dwn_left = grid[i+1] == nil ? nil : grid[i+1][j-1]
          element.up_right = grid[i-1] == nil ? nil : grid[i-1][j+1]
          element.dwn_right = grid[i+1] == nil ? nil : grid[i+1][j+1]
        end
      end
    end

  end
end