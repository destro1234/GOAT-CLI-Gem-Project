require 'nokogiri'
require 'pry'
class GOATCLI::CLI


  @@team = []

  def call
    GOATCLI::Scraper.new
    scraped_players = GOATCLI::Scraper.scrape_players
    GOATCLI::Player

    puts GOATCLI::Scraper.list_of_players

    puts "Enter the first player you would like to compare?"
    input = gets.strip
    puts GOATCLI::Player.find_by_name(input)
    puts GOATCLI::Scraper.list_of_players
    puts "Enter the second player you would like to compare?"
    input2 = gets.strip
    puts GOATCLI::Player.find_by_name(input2)

    puts "Do you want to continue comparing, or add player?"
    input = gets.strip

    if input =="continue comparing"
      call
    elsif input == "add player"
      puts "Which player would you like to add to your team?"
      player = gets.strip
      add_to_team(player)
    end

    #until @@team.length == 5
      #call

    #end
    #@players = GOATCLI::Player.all
    #@team = GOATCLI::DreamTeam


  end

  def add_to_team(input)
    @@team << input
    puts @@team
  end
end
