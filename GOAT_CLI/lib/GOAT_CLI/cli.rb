class GOATCLI::CLI

  def call
    puts "The Dream Team was the greatest team of NBA superstars ever formed. Here you can compare players and create your own Dream Team starting 5. What position do you want to compare first? Point Guard, Shooting Guard, Small Forward, Power Forward or Center?"
    list_pointguards
    stats
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
