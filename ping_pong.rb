class Player
  attr_accessor :name, :shot_chances, :return_chances
  
  def initialize(name, shot_chances, return_chances)
    self.name = name
    self.shot_chances = shot_chances
    self.return_chances = return_chances
  end
  
  def shot
    rand_percent = rand(100) # generates num from 0 to 99, inclusive
    
    if rand_percent < shot_chances[:flat]
      return :flat
    elsif rand_percent < shot_chances[:slice]
      return :slice
    elsif rand_percent < shot_chances[:topspin]
      return :topspin
    else
      return :unreturnable
    end
  end
  
  def return?(shot_type, serve = false)
    return false if shot_type == :unreturnable
    
    chance_to_return = serve ? return_chances[shot_type] - 10 : return_chances[shot_type]
    
    rand(100) < chance_to_return
  end
end

class Game
  attr_accessor :player1, :player2, :player1_points, :player2_points, :server, :receiver
  
  def initialize(player1, player2)
    self.player1, self.player2 = player1, player2
    
    self.server = player1
    self.receiver = player2
    
    self.player1_points = 0
    self.player2_points = 0
  end
  
  def volley
    volley_winner = nil
    current_hitter = server
    current_receiver = receiver
    
    shot_type = server.shot
    puts "#{current_hitter.name} serves a nasty #{shot_type}."
    
    if current_receiver.return?(shot_type, true)
      until volley_winner
        current_hitter, current_receiver = current_receiver, current_hitter
        
        shot_type = current_hitter.shot
        puts "#{current_hitter.name} successfully returns with a #{shot_type}."
        volley_winner = current_hitter unless current_receiver.return?(shot_type)
      end
    else
      volley_winner = server
    end
    
    puts "#{current_receiver.name} is unable to return the #{shot_type}. #{current_hitter.name} wins the point!"
    volley_winner
  end
  
  def play
    until winner
      if (player1_points + player2_points) % 5 == 0
        self.server, self.receiver = self.receiver, self.server
      end
      
      volley_winner = volley
      if volley_winner == player1
        self.player1_points += 1
      else
        self.player2_points += 1
      end
      
      puts "The score is now #{player1.name} with #{player1_points} points, #{player2.name} with #{player2_points} points."
    end
    
    puts "#{winner.name} wins!"
  end
  
  def winner
    return player1 if player1_points >= 21
    return player2 if player2_points >= 21
  end
end