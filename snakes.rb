class SnakesLadders
  def initialize
    @player_1 = 0
    @player_2 = 0
    @turn_order = true
    @game_over = false
  end

  def ret_p1
    return @player_1
  end

  def ret_p2
    return @player_2
  end

  def roll
    return rand(6) + 1
  end

  def random
    play(roll,roll)
  end

  def play(die1,die2)
    #deal with game over
    if @game_over
      puts "Game over!"
    end
    #current turn order
    if @turn_order
      current_player = @player_1
      player_number = 1
    else
      current_player = @player_2
      player_number = 2
    end

    current_player = current_player + die1 + die2

    #deal with greater than 100
    if current_player > 100
      current_player = 200 - current_player
    end

    #deal with S and L
    snakes_ladders = {2 => 38, 7 => 14, 8 => 31, 15 => 26, 16 => 6, 21=>42, 28=>84, 36=>44, 46=>25, 49=>11, 51=>67, 62=>19, 64=>60, 71=>91, 74=>53, 78=>98, 87=>94, 89=>68, 92=>88, 95=>75, 99=>80}
    if snakes_ladders.include?(current_player)
      current_player = snakes_ladders[current_player]
    end

    #see if win
    if current_player == 100
      @game_over = true
      puts "Player #{player_number} Wins!"
    end

    #cnange player
    if @turn_order
      @player_1 = current_player
      if die1 != die2
        @turn_order = false
      end
    else
      @player_2 = current_player
      if die1 != die2
        @turn_order = true
      end
    end
    #return current position
    puts "Player #{player_number} is on square #{current_player}"
  end

end

game = SnakesLadders.new

until game.ret_p1 == 100 || game.ret_p2 == 100 do
  game.random
end
