class GOATCLI::DreamTeam
  attr_accessor :pg, :sg, :sf, :pf, :c

  @@all = ()


  def initialize(team_hash)
    team_hash.each do |key, value|
      self.send("#{key}=", value)
    end
  end

  def self.all
    @@all
  end

  def self.to_s
   puts  "#{self.pg} - #{self.sg} - #{self.sf} - #{self.pf} - #{self.c}"

  end

end
