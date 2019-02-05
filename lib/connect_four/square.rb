module ConnectFour
  class Square
    attr_reader :row, :col
    attr_accessor :value, :left, :right, :top, :bottom
    attr_accessor :up_left, :dwn_left, :up_right, :dwn_right

    def initialize(input)
      args = defaults.merge(input)
      @row = args[:row]
      @col = args[:col]
      @value = args[:value]
      @left = args[:left]
      @right = args[:right]
      @top = args[:top]
      @bottom = args[:bottom]
      @up_left = args[:up_left]
      @dwn_left = args[:dwn_left]
      @up_right = args[:up_right]
      @dwn_right = args[:dwn_right]
    end

    private
    def defaults
      {
      value: " ",
      left: nil,
      right: nil,
      top: nil,
      bottom: nil,
      up_left: nil,
      dwn_left: nil,
      up_right: nil,
      dwn_right: nil
      }
    end

  end
end