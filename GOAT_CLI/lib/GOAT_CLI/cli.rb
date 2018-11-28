require 'nokogiri'
require 'pry'
class GOATCLI::CLI


  @@team = []

  def call

    @scraped_players = GOATCLI::Scraper.scrape_players
    @scraped_players.shift
    player_objects = @scraped_players.each do |player|
    GOATCLI::Player.new(player)
  end

    puts "\n"
    list_of_players
    puts "\n"
    puts "Enter the 1- 50, the first player you would like to compare?"

    input = gets.strip
    puts "\n"

    find_by_name(input)

    puts "\n"

    list_of_players

    puts "\n"

    puts "Enter the second player you would like to compare?"
    input2 = gets.strip

    puts "\n"

    find_by_name(input2)

    puts "\n"

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

  def list_of_players
    GOATCLI::Player.all.each_with_index do |player, index|
      puts "#{index+1}. #{player.name}"
    end
  end

  def find_by_name(input)
    @scraped_players.detect {|p| puts p if p[:name] == input}
  end

  def add_to_team(input)
    @@team << input
    puts @@team
  end
end
