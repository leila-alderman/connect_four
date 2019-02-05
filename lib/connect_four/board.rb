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
          if j-1 >= 0 && j-1 <= 6
            element.left =  grid[i][j-1]
          else
            element.left = nil
          end
          if j+1 >= 0 && j+1 <= 6
            element.right = grid[i][j+1]
          else
            element.right = nil
          end
          if i-1 >= 0 && i-1 <= 5
            element.top = grid[i-1][j]
          else
            element.top = nil
          end
          if i+1 >= 0 && i+1 <= 5
            element.bottom = grid[i+1][j]
          else
            element.bottom = nil
          end
          if (i-1 >= 0 && i-1 <= 5) && (j-1 >= 0 && j-1 <= 6)
            element.up_left = grid[i-1][j-1]
          else
            element.up_left = nil
          end
          if (i+1 >= 0 && i+1 <= 5) && (j-1 >= 0 && j-1 <= 6)
            element.dwn_left = grid[i+1][j-1]
          else
            element.dwn_left = nil
          end
          if (i-1 >= 0 && i-1 <= 5) && (j+1 >= 0 && j+1 <= 6)
            element.up_right = grid[i-1][j+1]
          else
            element.up_right = nil
          end
          if (i+1 >= 0 && i+1 <= 5) && (j+1 >= 0 && j+1 <= 6)
            element.dwn_right = grid[i+1][j+1]
          else
            element.dwn_right = nil
          end
        end
      end
    end

  end
end