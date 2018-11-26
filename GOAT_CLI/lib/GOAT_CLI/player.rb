class GOATCLI::Player

  attr_accessor :name, :position, :teams_played_for

  @@all = []

  def initialize(player_hash)
    player_hash.each do |key, value|
      self.send("#{key}=", value)
    end
    #player = self.new
    #player.name = "Lebron James"
    #player.stats = "Cleveland Cavaliers"
    @@all << self
  end

  def self.find_by_name(input)
    @@all.detect {|p| puts p.teams_played_for if p.name == input}
  end


  def self.all
    #should return instances of players
    @@all
  end


end
