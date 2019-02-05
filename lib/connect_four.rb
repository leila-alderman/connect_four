require "connect_four/version"
require "connect_four/square"
require "connect_four/player"
require "connect_four/board"
require "connect_four/game"

module ConnectFour
  class Error < StandardError; end

  def initialize(name)
    @name = name
  end
end
