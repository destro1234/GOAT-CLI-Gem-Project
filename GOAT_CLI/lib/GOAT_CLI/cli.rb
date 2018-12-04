require 'nokogiri'
require 'pry'
class GOATCLI::CLI

  def initialize
      make_players
  end

  def call
    puts "The Dream Team was the greatest team of NBA superstars ever formed. Here you can compare players and create your own Dream Team starting 5.\n"
    puts "\n"

    GOATCLI::Player.list_of_players

    puts "\nEnter 1-50, the first player you would like to compare?"
    first_player = gets.strip

    GOATCLI::Player.list_of_players

    puts "\nEnter 1-50, second player you would like to compare?"
    second_player = gets.strip

    puts "\n"
     GOATCLI::Player.find(first_player).to_s  #|| GOATCLI::Player.find_by_name(first_player).to_s
    puts "\n"
     GOATCLI::Player.find(second_player).to_s   #|| GOATCLI::Player.find_by_name(second_player).to_s
    puts "\n"
    compare

    puts "Are you done creating your dream team?(yes/no)"
    input = gets.strip
    if input.downcase != "yes"
      call
    end
    #@players = GOATCLI::Player.all
    @dreamteam = GOATCLI::DreamTeam.new(GOATCLI::Player.team)
    puts "\nThis is your Dream Team!"
    @dreamteam.to_s
  end

  def make_players
    scraped_players = GOATCLI::Scraper.new.scrape_players
    scraped_players.shift
    scraped_players.each do |player|
    GOATCLI::Player.new(player)
  end
end

  def compare
    puts "Do you want to continue comparing or add player?"
    input = gets.strip

    if input == "continue comparing"
      call
    elsif input == "add player"
      puts "Which position would you like to add to your team pg, sg, sf, pf or c?"
      position = gets.strip
      GOATCLI::Player.add_to_team(position)
      @dreamteam.to_s
    else
      compare
    end

  end
end
