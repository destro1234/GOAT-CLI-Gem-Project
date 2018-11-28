require 'nokogiri'
require 'pry'
class GOATCLI::CLI


  @@team = []

  def call

    make_players

    puts "\n"
    list_of_players
    puts "\n"
    puts "Enter the first player you would like to compare?"

    input = gets.strip

    list_of_players

    puts "\n"

    puts "Enter the second player you would like to compare?"
    input2 = gets.strip

    puts "\n"
    find_by_name(input).to_s
    find_by_name(input2).to_s

    puts "\n"

    puts "Do you want to continue comparing, or add player?"
    input3 = gets.strip

    if input3 =="continue comparing"
      call
    elsif input3 == "add player"
      puts "Which player would you like to add to your team?"
      player = gets.strip
      add_to_team(find_by_name(player).to_s)
    end

    #until @@team.length == 5
      #call

    #end
    #@players = GOATCLI::Player.all
    #@team = GOATCLI::DreamTeam


  end

  def make_players
    @scraped_players = GOATCLI::Scraper.scrape_players
    @scraped_players.shift
    player_objects = @scraped_players.each do |player|
    GOATCLI::Player.new(player)
  end
end

  def list_of_players
      puts "50 Greatest Basketball Players of All Time"
      puts "\n"

    GOATCLI::Player.all.each do |player, index|
      puts "#{player.name}"
    end
  end

  def find_by_name(input)
    GOATCLI::Player.all.find {|p| p if p.name == input}
  end

  def add_to_team(input)
    @@team << input
    puts @@team
  end
end
