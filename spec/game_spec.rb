require "game"

describe Game do
  before { @game = Game.new("Alice", "Bob") }

  context "#initialize" do
    it "initializes with a board" do
      expect(@game.board.grid[1]).to eq []
    end

    it "initializes with two players" do
      expect(@game.player_1.name).to eq("Alice")
      expect(@game.player_2.name).to eq("Bob")
    end
  end

end
