require "./lib/connect_four.rb"

RSpec.describe ConnectFour do

  before do
    @game = ConnectFour.new("Alice", "Bob")
  end

  context "#initialize" do
    it "raises an error if not given input" do
      expect{ ConnectFour.new }.to raise_error(ArgumentError)
    end

    it "raises an error if given only one name" do
      expect{ ConnectFour.new("Alice") }.to raise_error(ArgumentError)
    end

    it "doesn't raise an error if given two names" do
      expect{ ConnectFour.new("Alice", "Bob")}.to_not raise_error
    end

    it "initializes a board" do
      expect(@game.board.grid[0][0].value).to eql " "
    end

    it "initializes with game logic" do
      expect(@game.logic.draw?).to eql false
    end

    it "initializes with player 1" do
      expect(@game.player_1.name).to eql "Alice"
    end

    it "initializes with player 2" do
      expect(@game.player_2.name).to eql "Bob"
    end
  end

  context "#play" do
  
  end

end