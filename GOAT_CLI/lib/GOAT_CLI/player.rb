class GOATCLI::Player

  attr_accessor :name, :stats

  @@all = []

  def initialize
     scraped_players = GOATCLI::Scraper.scrape_players
    #player = self.new
    #player.name = "Lebron James"
    #player.stats = "Cleveland Cavaliers"
    @@all << self
  end


  def self.find_by_name(input)
    @@all.select {|p| puts p.name if p.name == input}
  end


  def self.all
    #should return instances of players
    @@all
  end


end
