RSpec.describe ConnectFour::GameLogic do

  context "#initialize" do
    it "requires input" do
      expect { ConnectFour::GameLogic.new }.to raise_error(ArgumentError)
    end

    it "initializes with input" do
      expect { ConnectFour::GameLogic.new('board')}.to_not raise_error
    end
  end

  context "#board" do
    before do
      @logic = ConnectFour::GameLogic.new('board')
    end

    it "can return board" do
      expect(@logic.board).to eql "board"
    end

    it "can't change the board" do
      expect{ @logic.board = "not_a_board" }.to raise_error(NoMethodError)
    end
  end

  context "#draw" do
    before do
      @board = ConnectFour::Board.new
      @logic = ConnectFour::GameLogic.new(@board)
      
    end

    it "returns false on empty board" do
      expect(@logic.draw?).to eql false
    end

    it "returns false on partially filled board" do
      @board.grid[0].each do |element|
        element.value = "X"
      end
      expect(@logic.draw?).to eql false
    end

    it "returns true on full board" do
      @board.grid.each do |row|
        row.each do |element|
          element.value = "X"
        end
      end
      expect(@logic.draw?).to eql true
    end
  end


end