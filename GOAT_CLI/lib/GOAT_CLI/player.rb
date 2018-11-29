class GOATCLI::Player

  attr_accessor :name, :teams_played_for, :position, :points, :rebounds, :assists, :championships_won, :all_star_nominations

  @@all = []

  def initialize(player_hash)
    player_hash.each do |key, value|
      self.send("#{key}=", value)
    end
    @@all << self
  end

  def to_s
      puts "#{self.name}\n - Teams Played For: #{self.teams_played_for}\n - Position: #{self.position}\n - Career Points: #{self.points}\n - Career Rebounds: #{self.rebounds} - Career Assists: #{self.assists} - Championships Won: #{self.championships_won} - All-Star Nominations: #{self.all_star_nominations}"
  end

  def self.all
    @@all
  end


end
