require "player"

describe Player do
  before { @player = Player.new("Laura") }
  context "#initialize" do
    it "requires a name" do
      expect { Player.new }.to raise_error(ArgumentError)
    end

    it "initializes with a name" do
      expect(@player.name).to eq "Laura"
    end

    it "can return a marker" do
      @player.marker = "\u2605"
      expect(@player.marker).to eq "★"
    end

  end
end