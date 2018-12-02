class GOATCLI::Player

  attr_accessor :index, :name, :teams_played_for, :position, :points, :rebounds, :assists, :championships_won, :all_star_nominations

  @@all = []

  @@team = {:pg => "", :sg => "", :sf => "", :pf => "", :c => ""}


  def initialize(player_hash)
    player_hash.each do |key, value|
      self.send("#{key}=", value)
    end
    @@all << self
  end

  def self.list_of_players
    puts "50 Greatest Basketball Players of All Time"
    puts "\n"
    self.all.each do |player|
      puts "#{player.index}. #{player.name}"
    end
  end

  def self.find_by_name(index)
    self.all.detect {|p| p if p.name == index}
  end

  def self.add_to_team(position)
    puts "Which player would you like to add to your team?"
    index = gets.strip
    @@team[:"#{position}"] = find_by_name(index).name
  end

  def to_s
    puts "#{self.name}\n - Teams Played For: #{self.teams_played_for}\n - Position: #{self.position}\n - Career Points: #{self.points}\n - Career Rebounds: #{self.rebounds} - Career Assists: #{self.assists} - Championships Won: #{self.championships_won} - All-Star Nominations: #{self.all_star_nominations}"
  end

  def self.all
    @@all
  end

  def self.team
    @@team
  end


end
