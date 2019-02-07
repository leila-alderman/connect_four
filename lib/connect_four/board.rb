# The Board class creates an interconnected grid and then keep track of the board state.

require "./lib/connect_four/square.rb"

class Board
  attr_accessor :grid
  attr_reader :rows, :columns

  def initialize 
    @rows = 6
    @columns = 7
    @grid = create_board
  end

  def add_token(col, marker)
    return "Invalid move: Column #{col} is already full." if grid[0][col].value != " "
    for i in 0..(rows-1)
      current = grid[i][col]
      down = current.down
      if down == nil
        current.value = marker
      else
        down_value = down.value
        if down_value == " "
          next
        else
          current.value = marker
          return
        end
      end
    end
  end


  private
  def create_board
    grid = []
    for i in 1..rows
      row = []
      for j in 1..columns
        row.push(create_square(i,j))
      end
      grid.push(row)
    end
    add_connections(grid)
    return grid
  end

  def create_square(i, j)
    Square.new({
      row: i,
      col: j
    })
  end

  def add_connections(grid)
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
          element.up = grid[i-1][j]
        else
          element.up = nil
        end
        if i+1 >= 0 && i+1 <= 5
          element.down = grid[i+1][j]
        else
          element.down = nil
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
