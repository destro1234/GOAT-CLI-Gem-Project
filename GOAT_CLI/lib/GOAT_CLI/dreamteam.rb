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

  def to_s
   puts  "\n - Point Guard: #{self.pg}\n - Shooting Guard: #{self.sg}\n - Small Forward: #{self.sf}\n - Power Forward: #{self.pf}\n - Center: #{self.c}"
 end

end
