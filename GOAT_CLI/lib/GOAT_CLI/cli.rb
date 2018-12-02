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

    puts "\nEnter the first player you would like to compare?"
    input = gets.strip

    GOATCLI::Player.list_of_players

    puts "\nEnter the second player you would like to compare?"
    input2 = gets.strip

    puts "\n"
    GOATCLI::Player.find_by_name(input).to_s
    puts "\n"
    GOATCLI::Player.find_by_name(input2).to_s
    puts "\n"
    compare

    puts "Are you done creating your dream team?"
  input3 = gets.strip
    if input3 != "Yes"
      call
    end
    #@players = GOATCLI::Player.all
    @dreamteam = GOATCLI::DreamTeam.new(GOATCLI::Player.team)
    puts "This is your Dream Team!"
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
    puts "Do you want to continue comparing, add player?"
    input = gets.strip

    if input == "continue comparing"
      call
    elsif input == "add player"
      puts "Which position would you like to add to your team pg, sg, sf, pf or c?"
      position = gets.strip
      GOATCLI::Player.add_to_team(position)
    end

  end
end
