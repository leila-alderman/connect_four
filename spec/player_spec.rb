require "./lib/connect_four/player.rb" 
require "./lib/connect_four/board.rb"

RSpec.describe Player do

  context "#initialize" do
    it "requires input" do
      expect { Player.new }.to raise_error(ArgumentError)
    end

    it "initializes with a valid hash" do
      expect{ Player.new({name: "Bob", marker: "H"})}.to_not raise_error
    end
  end

  before do 
    @player = Player.new({
      name: "Laura", 
      marker: "X"})
  end

  context "#name" do
    it "returns the name" do
      expect(@player.name).to eql "Laura"
    end

    it "can't change the name" do
      expect { @player.name = "Bob" }.to raise_error(NoMethodError)
    end
  end

  context "#marker" do
    it "returns the marker" do
      expect(@player.marker).to eql "X"
    end

    it "works for a unicode marker" do
      player2 = Player.new({
        name: "Lisa",
        marker: "\u2605"
      })
      expect(player2.marker).to eql "★"
    end

    it "can't change the marker" do
      expect { @player.marker = "O" }.to raise_error(NoMethodError)
    end
  end

  context "#drop_token" do
    before do
      @board = Board.new 
      @board.grid[5][2].value = "O"
      @board.grid[3][4].value = "O"
      @board.grid[0][1].value = "X"
    end

    it "drops tokens to the bottom of empty columns" do
      @player.drop_token(@board, 0)
      expect(@board.grid[5][0].value).to eql "X"
    end

    it "drops tokens on top of a bottom token" do
      @player.drop_token(@board, 2)
      expect(@board.grid[4][2].value).to eql "X"
    end

    it "drops tokens on top of higher up tokens" do
      @player.drop_token(@board, 4)
      expect(@board.grid[2][4].value).to eql "X"
    end

    it "returns error message when a column is full" do
      expect(@player.drop_token(@board, 1)).to eql "Invalid move: Column 1 is already full."
    end
  end

end