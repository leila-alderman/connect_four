RSpec.describe ConnectFour::Board do
  before { @board = ConnectFour::Board.new }

  context "#initialize" do
    it "has a default value of ' '" do
      expect(@board.grid[0][0].value).to eq ' '
    end

    it "creates a grid with 6 rows" do
      expect(@board.grid.length).to eq 6
    end

    it "creates a grid with 7 columns" do
      @board.grid.each do |row|
        expect(row.length).to eq 7
      end
    end
  end

  context "#grid" do
    it "can access an empty cell" do
      expect(@board.grid[5][2].value).to eq " "
    end

    it "can change the grid" do
      @board.grid[4][3].value = "X"
      expect(@board.grid[4][3].value).to eq "X"
    end
  end

  context "left connections" do
    it "can access squares to the left" do
      expect(@board.grid[4][3].left).to equal @board.grid[4][2]
    end

    it "can access squares farther to the left" do
      expect(@board.grid[2][5].left.left).to equal @board.grid[2][3]
    end

    it "returns nil outside of the board" do
      expect(@board.grid[3][0].left).to eql nil
    end
  end

  context "right connections" do
    it "can access squares to the right" do
      expect(@board.grid[4][4].right).to equal @board.grid[4][5]
    end

    it "can access squares farther to the right" do
      expect(@board.grid[3][2].right.right).to equal @board.grid[3][4]
    end

    it "returns nil outside of the board" do
      expect(@board.grid[1][6].right).to be_nil
    end
  end

  context "top connections" do
    it "can access squares to the top" do
      expect(@board.grid[3][3].top).to equal @board.grid[2][3]
    end

    it "can access squares farther to the top" do
      expect(@board.grid[2][0].top.top).to equal @board.grid[0][0]
    end

    it "returns nil outside of the board" do
      expect(@board.grid[0][4].top).to be_nil
    end
  end

  context "bottom connections" do
    it "can access squares to the bottom" do
      expect(@board.grid[4][3].left).to equal @board.grid[4][2]
    end

    it "can access squares farther to the bottom" do
      expect(@board.grid[2][5].left.left).to equal @board.grid[2][3]
    end

    it "returns nil outside of the board" do
      expect(@board.grid[5][3].bottom).to be_nil
    end
  end

  context "up_left connections" do
    it "can access squares to the upper left" do
      expect(@board.grid[3][3].up_left).to equal @board.grid[2][2]
    end

    it "can access squares farther to the upper left" do
      expect(@board.grid[2][2].up_left.up_left).to equal @board.grid[0][0]
    end
  end

  context "dwn_left connections" do
    it "can access squares to the lower left" do
      expect(@board.grid[3][3].dwn_left).to equal @board.grid[4][2]
    end

    it "can access squares farther to the lower left" do
      expect(@board.grid[2][5].dwn_left.dwn_left).to equal @board.grid[4][3]
    end
  end

  context "up_right connections" do
    it "can access squares to the upper right" do
      expect(@board.grid[4][0].up_right).to equal @board.grid[3][1]
    end

    it "can access squares farther to the upper right" do
      expect(@board.grid[5][2].up_right.up_right).to equal @board.grid[3][4]
    end
  end

  context "dwn_right connections" do
    it "can access squares to the lower right" do
      expect(@board.grid[3][3].dwn_right).to equal @board.grid[4][4]
    end

    it "can access squares farther to the lower right" do
      expect(@board.grid[2][0].dwn_right.dwn_right).to equal @board.grid[4][2]
    end
  end

end