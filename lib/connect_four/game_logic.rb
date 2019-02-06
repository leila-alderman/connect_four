module ConnectFour
  class GameLogic
    attr_reader :board

    def initialize(board)
      @board = board
    end

    def draw?
      flat_board = board.grid.flatten
      flat_board.none? { |node| node.value == " " }
    end

    def winner?
      flat_board = board.grid.flatten
      full_nodes = flat_board.select { |node| node.value != " " }
      return false if full_nodes == []
      full_nodes.each do |node|
        if win_left?(node)
          return true
        elsif win_down?(node)
          return true
        elsif win_dwn_left?(node)
          return true
        elsif win_dwn_right?(node)
          return true
        end
      end
      false
    end

    private
    def win_left?(node)
      marker = node.value
      if node.left
        left_1 = node.left
        if left_1.value == marker && left_1.left
          left_2 = left_1.left
          if left_2.value == marker && left_2.left
            left_3 = left_2.left
            if left_3.value == marker
              return true
            else return false
            end
          else return false
          end
        else return false
        end
      else return false
      end
    end

    def win_down?(node)
      marker = node.value
      if node.down
        down_1 = node.down
        if down_1.value == marker && down_1.down
          down_2 = down_1.down
          if down_2.value == marker && down_2.down
            down_3 = down_2.down
            if down_3.value == marker
              return true
            else return false
            end
          else return false
          end
        else return false
        end
      else return false
      end
    end


    def win_dwn_left?(node)
      marker = node.value
      if node.dwn_left
        dwn_left_1 = node.dwn_left
        if dwn_left_1.value == marker && dwn_left_1.dwn_left
          dwn_left_2 = dwn_left_1.dwn_left
          if dwn_left_2.value == marker && dwn_left_2.dwn_left
            dwn_left_3 = dwn_left_2.dwn_left
            if dwn_left_3.value == marker
              return true
            else return false
            end
          else return false
          end
        else return false
        end
      else return false
      end
    end   

    def win_dwn_right?(node)
      marker = node.value
      if node.dwn_right
        dwn_right_1 = node.dwn_right
        if dwn_right_1.value == marker && dwn_right_1.dwn_right
          dwn_right_2 = dwn_right_1.dwn_right
          if dwn_right_2.value == marker && dwn_right_2.dwn_right
            dwn_right_3 = dwn_right_2.dwn_right
            if dwn_right_3.value == marker
              return true
            else return false
            end
          else return false
          end
        else return false
        end
      else return false
      end
    end

    


  
  end
end