class GOATCLI::Player

  attr_accessor :name, :position, :stats #:points, :teams_played_for

  @@all = []

  def initialize(player_hash)
    player_hash.each do |key, value|
      self.send("#{key}=", value)
    end
    @@all << self
  end

  def self.all
    @@all
  end


end
