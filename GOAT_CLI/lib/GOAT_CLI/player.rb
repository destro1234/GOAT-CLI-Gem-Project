class GOATCLI::Player

  attr_accessor :name, :position, :points, :rebounds, :teams_played_for

  @@all = []

  def initialize(player_hash)
    player_hash.each do |key, value|
      self.send("#{key}=", value)
    end
    @@all << self
  end

  def to_s
      puts "#{self.name} - Position: #{self.position} - Career Points: #{self.points} - Career Rebounds: #{self.rebounds}"
  end

  def self.all
    @@all
  end


end
