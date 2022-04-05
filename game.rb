class Game
  attr_accessor :current_player

  def initialize
    @current_player = nil
    @players = []    
  end

  def start_game
    puts "Welcome to TwO-O-Player Math Game!"

    # Create Players and add to @players array  
    player_one = Player.new("Player 1")
    @players << player_one
    player_two = Player.new("Player 2")
    @players << player_two

    # Set current player
    @current_player = player_one    

    while @current_player.lives > 0 && @current_player.score < 3
      play_round      
    end
    game_end    
  end

  def play_round       
    # ask question
    question = Question.new    
    puts "#{@current_player.name}: " + question.ask_question
    print "> "
    guess = gets.chomp.to_i    
    result = question.evaluate_answer(guess)    
    
    # assess result
    if result == true
      puts "YES! You are correct."
      @current_player.earn_point      
      puts "P1: #{@players[0].score}/3 vs P2: #{@players[1].score}/3"      
    else
      puts "Seriously! NO!"
      @current_player.remove_life
      puts "P1: #{@players[0].score}/3 vs P2: #{@players[1].score}/3"      
    end
    puts "----- NEW TURN -----"

    #switch current player
    switch_player       
  end

  def switch_player
    if @current_player == @players[0]
      @current_player = @players[1]
    else @current_player = @players[0]
    end
  end

  def game_end  
    if @current_player.score == 3
      puts "... some time later ..."
      puts "#{@current_player.name} wins with a score of #{@current_player.score}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
    end
    if @current_player.lives == 0
      switch_player
      puts "#{@current_player.name} wins with a score of #{@current_player.score}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
    end   
  end

end