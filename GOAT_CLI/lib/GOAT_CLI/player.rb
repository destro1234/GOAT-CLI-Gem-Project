class GOATCLI::Player

  attr_accessor :name, :position, :bio, :stats

  def self.all
    #should return instances of players
    puts " What position do you want to compare? Point Guard, Shooting Guard, Small Forward, Power Forward or Center?"

    input = gets.strip
    puts "list of #{input}s"
    player = self.new
    player.name = "name"
    player.position = input
    player.bio = "bio"
    player.stats = "stats"
    puts player

  end


end
