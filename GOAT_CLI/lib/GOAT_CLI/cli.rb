require 'nokogiri'
require 'pry'
class GOATCLI::CLI


  @@team = []

  def call

    #positions
    #compare

    #puts "Do you want to continue comparing, or add player?"
    #input = gets.strip

    #if input =="continue comparing"
      #call
    #elsif input == "add player"
      #puts "Which player would you like to add to your team?"
      #player = gets.strip
      #add_to_team(player)
    #end

    #until @@team.length == 5
      #call

    #end
    GOATCLI::Scraper.scrape_small_forward
    #@players = GOATCLI::Player.all
    #@team = GOATCLI::DreamTeam


  end

  def positions
    puts " What position do you want to compare? Point Guard, Shooting Guard, Small Forward, Power Forward or Center?"

    input = gets.strip
    puts "list of #{input}s"
  end

  def compare
    puts "Enter the first player you would you like to compare?"
    input = gets.strip
    puts "Enter the second player you would like to compare?"
    input2 = gets.strip
    puts "#{input}, #{input2}"
  end

  def add_to_team(input)
    @@team << input
    puts @@team
  end
end
