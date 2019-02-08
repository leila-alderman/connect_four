# The Connect Four class brings together the Player, Board, and GameLogic classes to create the game flow.

require "./lib/connect_four/player"
require "./lib/connect_four/board"
require "./lib/connect_four/game_logic"

class ConnectFour
  attr_reader :board, :logic, :player_1, :player_2

  def initialize(name_1, name_2)
    @board = Board.new
    @logic = GameLogic.new(@board)
    @player_1 = Player.new({name: name_1, marker: "\u2606"})
    @player_2 = Player.new({name: name_2, marker: "\u2605"})
    players = [player_1, player_2]
    @game_over = false
    @current_player, @other_player = players.shuffle
  end

  def play
    system("clear")
    show_board
    print_rules
    while @game_over == false
      switch_players
      play_turn(@current_player)
      check_draw
      check_win
    end
  end

  private
  def show_board
    puts "\n\n"
    for i in 1..board.columns
      print "| #{i} " 
    end
    print "| \n"
    board.grid.each do |row|
      print row.map { |square| "| #{square.value} " }.join
      print "| \n"
    end
  end

  def print_rules
    puts "\n \n \n"
    puts "Welcome #{player_1.name} and #{player_2.name}! \n"
    puts "The goal of the game is to get four your tokens in a row horizontally, vertically, or diagonally. 
Each turn, you can drop one of your tokens in a column by entering the column number (shown above the board)."
    puts "#{player_1.name}, your token is #{player_1.marker}."
    puts "#{player_2.name}, your token is #{player_2.marker}."
    puts "Let's play!\n \n"
  end

  def play_turn(player)
    col = get_input(player)
    return if @game_over == true
    player.drop_token(board, col)
    system("clear")
    show_board
  end

  def get_input(player)
    puts "It's #{player.name}'s turn."
    puts "Enter the column number where you want to drop your token or enter q to quit."
    col = gets.chomp

    if col == "q"
      puts "Thanks for playing!"
      @game_over = true
    elsif col.to_i.is_a?(Integer) == false || col.to_i.between?(1,7) == false
      puts "Please enter an integer between 1 and 7."
      get_input(player)
    else
      return col.to_i - 1
    end
  end

  def switch_players
    @current_player, @other_player = @other_player, @current_player
  end

  def check_draw
    if logic.draw?
      puts "Game over! It's a draw."
      @game_over = true
    end
  end

  def check_win
    if logic.winner?
      puts "Congratuations, #{@current_player.name}! You won!"
      @game_over = true
    end
  end



end