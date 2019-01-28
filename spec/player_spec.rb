require "player"

describe Player do
  before { @player = Player.new("Laura", "X") }
  context "#initialize" do
    it "requires a name" do
      expect { Player.new }.to raise_error(ArgumentError)
    end

    it "initializes with a name" do
      expect(@player.name).to eq "Laura"
    end

    it "initializes with a marker" do
      expect(@player.marker).to eq "X"
    end

    it "can return a different marker" do
      @player.marker = "\u2605"
      expect(@player.marker).to eq "★"
    end

  end
end