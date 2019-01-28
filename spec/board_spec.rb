require "board"

describe Board do
  before { @board = Board.new }
  context "#initialize" do
    it "creates an empty board" do
      expect(@board.grid).to eq [[],[],[],[],[],[],[]]
    end
  end

  context "#grid" do
    it "can access an empty cell" do
      expect(@board.grid[1]).to eq []
    end

    it "can change the grid" do
      @board.grid[1].push("X")
      expect(@board.grid[1]).to eq ["X"]
    end
  end
end