require "connect_four/board"

describe ConnectFour::Board do
  before { @board = ConnectFour::Board.new }
  context "#initialize" do
    it "creates an empty board" do
      expect(@board.grid[0]).to eq [" "," "," "," "," "," "]
    end

    it "creates a grid with 7 columns" do
      expect(@board.grid.length).to eq 7
    end

    it "creates a grid with 6 rows" do
      @board.grid.each do |column|
        expect(column.length).to eq 6
      end
    end
  end

  context "#grid" do
    it "can access an empty cell" do
      expect(@board.grid[5][2]).to eq " "
    end

    it "can change the grid" do
      @board.grid[4][3] = ("X")
      expect(@board.grid[4][3]).to eq "X"
    end
  end
end