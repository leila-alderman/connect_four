require "./lib/connect_four/game.rb"

RSpec.describe Game do

  before { @game = Game.new("Alice", "Bob") }

  xcontext "#initialize" do
    it "requires two names" do
      expect { Game.new("Alice") }.to raise_error(ArgumentError)
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
