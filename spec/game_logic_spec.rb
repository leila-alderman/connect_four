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

  context "#winner?"
  before do
    @board = ConnectFour::Board.new
    @logic = ConnectFour::GameLogic.new(@board)  
  end

  it "returns false on empty board" do
    expect(@logic.winner?).to eql false
  end

  it "returns false on a partially filled board" do
    @board.grid[5].each_with_index do |node, i|
      if i % 2 == 0
        node.value = "X"
      else
        node.value = "O"
      end
    end
    expect(@logic.winner?).to eql false
  end

  it "returns true for a horizontal win at the bottom" do
    @board.grid[5].each do |node|
      node.value = "X"
    end
    expect(@logic.winner?).to eql true
  end

  it "returns true for a horizontal win at the top" do
    @board.grid[0].each do |node|
      node.value = "X"
    end
    expect(@logic.winner?).to eql true
  end

  it "returns true for a vertical win at the left" do
    @board.grid.each do |row|
      row[0].value = "X"
    end
    expect(@logic.winner?).to eql true
  end

  it "returns true for a vertical win at the right" do
    @board.grid.each do |row|
      row[6].value = "X"
    end
    expect(@logic.winner?).to eql true
  end

  it "returns true for a dwn_left win" do
    @board.grid[0][4].value = "X"
    @board.grid[1][3].value = "X"
    @board.grid[2][2].value = "X"
    @board.grid[3][1].value = "X"
    expect(@logic.winner?).to eql true
  end

  it "returns true for a dwn_right win" do
    @board.grid[0][1].value = "X"
    @board.grid[1][2].value = "X"
    @board.grid[2][3].value = "X"
    @board.grid[3][4].value = "X"
    expect(@logic.winner?).to eql true
  end

end