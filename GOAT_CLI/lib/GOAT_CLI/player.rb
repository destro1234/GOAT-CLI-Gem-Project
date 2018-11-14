class GOATCLI::Player

  def self.all
    #should return instances of players
    puts " What position do you want to compare? Point Guard, Shooting Guard, Small Forward, Power Forward or Center?"

    input = gets.strip
    puts "list of #{input}s"
  end
end
