RSpec.describe ConnectFour::Square do
  
  context "#initialize" do
    it "raises an error when not given input parameters" do
      expect { ConnectFour::Square.new }.to raise_error(ArgumentError)
    end

    it "doesn't raise an error when given a valid input hash" do
      expect { ConnectFour::Square.new({row: 2, col: 4}) }.to_not raise_error
    end

    it "doesn't raise an error when given additional hash values" do
      expect { ConnectFour::Square.new({row: 2, col: 4, 
      left: 5, right: 7, dwn_left: 16}) }.to_not raise_error
    end
  end

  before do
    @square = ConnectFour::Square.new({
      row:        2,
      col:        3,
      left:       4,
      right:      5,
      top:        6,
      bottom:     7,
      up_left:    8,
      dwn_left:   9,
      up_right:   10,
      dwn_right:  11
      })
    @default_square = ConnectFour::Square.new({
      row:    2,
      col:    3
    })
  end

  context "#value" do
    it "returns the default value" do
      expect(@square.value).to eql " "
    end

    it "can change the value" do
      @square.value = "55"
      expect(@square.value).to eql "55"
    end
  end

  context "#row" do 
    it "returns the given value" do
      expect(@square.row).to eql 2
    end

    it "can't be changed" do
      expect{ @square.row = 55 }.to raise_error(NoMethodError)
    end
  end

  context "#col" do 
    it "returns the given value" do
      expect(@square.col).to eql 3
    end

    it "can't be changed" do
      expect{ @square.col = 55 }.to raise_error(NoMethodError)
    end
  end

  context "#left" do
    it "returns the given value" do
      expect(@square.left).to eql 4
    end

    it "can be changed" do
      @square.left = 55
      expect(@square.left).to eql 55
    end

    it "has a default value of nil" do
      expect(@default_square.left).to be_nil
    end
  end

  context "#right" do
    it "returns the given value" do
      expect(@square.right).to eql 5
    end

    it "can be changed" do
      @square.right = 55
      expect(@square.right).to eql 55
    end

    it "has a default value of nil" do
      expect(@default_square.right).to be_nil
    end
  end  

  context "#top" do
    it "returns the given value" do
      expect(@square.top).to eql 6
    end

    it "can be changed" do
      @square.top = 56
      expect(@square.top).to eql 56
    end

    it "has a default value of nil" do
      expect(@default_square.top).to be_nil
    end
  end

  context "#bottom" do
    it "returns the given value" do
      expect(@square.bottom).to eql 7
    end

    it "can be changed" do
      @square.bottom = 57
      expect(@square.bottom).to eql 57
    end

    it "has a default value of nil" do
      expect(@default_square.bottom).to be_nil
    end
  end

  context "#up_left" do
    it "returns the given value" do
      expect(@square.up_left).to eql 8
    end

    it "can be changed" do
      @square.up_left = 58
      expect(@square.up_left).to eql 58
    end

    it "has a default value of nil" do
      expect(@default_square.up_left).to be_nil
    end
  end

  context "#dwn_left" do
    it "returns the given value" do
      expect(@square.dwn_left).to eql 9
    end

    it "can be changed" do
      @square.dwn_left = 59
      expect(@square.dwn_left).to eql 59
    end

    it "has a default value of nil" do
      expect(@default_square.dwn_left).to be_nil
    end
  end

  context "#up_right" do
    it "returns the given value" do
      expect(@square.up_right).to eql 10
    end

    it "can be changed" do
      @square.up_right = 60
      expect(@square.up_right).to eql 60
    end

    it "has a default value of nil" do
      expect(@default_square.up_right).to be_nil
    end
  end

  context "#dwn_right" do
    it "returns the given value" do
      expect(@square.dwn_right).to eql 11
    end

    it "can be changed" do
      @square.dwn_right = 61
      expect(@square.dwn_right).to eql 61
    end

    it "has a default value of nil" do
      expect(@default_square.dwn_right).to be_nil
    end
  end

end