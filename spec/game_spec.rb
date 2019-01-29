require "connect_four/game"

describe ConnectFour::Game do
  before { @game = ConnectFour::Game.new("Alice", "Bob") }

  context "#initialize" do
    it "requires two names" do
      expect { ConnectFour::Game.new("Alice") }.to raise_error(ArgumentError)
    end  
  
    it "initializes with a board" do
      expect(@game.board.grid[6]).to eq [" "," "," "," "," "," "]
    end

    it "initializes with two players" do
      expect(@game.player_1.name).to eq "Alice"
      expect(@game.player_2.name).to eq "Bob" 
    end

    it "initalizes with the player markers" do
      expect(@game.player_1.marker).to eq "☆"
      expect(@game.player_2.marker).to eq "★"
    end
  end

  # game.drop_piece

  # game.get_status


end
