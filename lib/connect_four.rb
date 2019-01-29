require_relative "./connect_four/version"
require_relative "./connect_four/player"
require_relative "./connect_four/board"
require_relative "./connect_four/game"

module ConnectFour
  class Error < StandardError; end

  def initialize(name)
    @name = name
  end
end
