class GOATCLI::CLI

  def call
    puts "The Dream Team was the greatest team of NBA superstars ever formed. Here you can compare players and create your own Dream Team starting 5."
    positions
    puts "Enter which two players would you like to compare?"
    #if point_guard
      #list_pointguards
    #elsif shooting_guard
      #list_shooting_guards
    #elsif small_forward
      #list_small_forwards
    #elsif power_forward
      #list power_forwards
    #elsif center
      #list centers
    #end
  end

  def positions
    puts " What position do you want to compare first? Point Guard, Shooting Guard, Small Forward, Power Forward or Center?"
    puts <<-DOC
      1.list point guards
      2.list shooting guards
      3.list small forwards
      4.list power forwards
      5.list centers
    DOC
  end

  def compare
    puts <<-DOC
    1.player_1.stats   2.player_2.stats
    DOC

  end



  def list_pointguards
    puts <<-DOC
      1.Magic Johnson
      2.Chris Paul
    DOC

  end

  def stats
    puts "Enter the players you want to compare"
    puts <<-DOC
    1. Magic Johnson.stats   2.Chris Paul.stats
    DOC
  end

end
