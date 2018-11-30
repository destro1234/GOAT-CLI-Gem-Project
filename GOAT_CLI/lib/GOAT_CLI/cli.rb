require 'nokogiri'
require 'pry'
class GOATCLI::CLI




  def initialize
      make_players
      @team = {:pg => "", :sg => "", :sf => "", :pf => "", :c => ""}
  end

  def call

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
    puts "\n"
    find_by_name(input2).to_s

    puts "\n"

  compare

  puts "Are you done creating your dream team?"
  input3 = gets.strip
    until input3 = "Yes"
      call

    end
    #@players = GOATCLI::Player.all
    dreamteam = GOATCLI::DreamTeam.new(@team)
    puts dreamteam.to_s
  end

  def make_players
    scraped_players = GOATCLI::Scraper.new.scrape_players
    scraped_players.shift
    scraped_players.each do |player|
    GOATCLI::Player.new(player)
  end
end

  def list_of_players
      puts "50 Greatest Basketball Players of All Time"
      puts "\n"

    GOATCLI::Player.all.each_with_index do |player, index|
      puts "#{index+1}. #{player.name}"
    end
  end

  def find_by_name(input)
    GOATCLI::Player.all.find {|p| p if p.name == input}
  end

  def add_to_team(position)
    puts "Which player would you like to add to your team?"
    player = gets.strip
    @team[:"#{position}"] = find_by_name(player).name
    puts @team
  end

  def compare
    puts "Do you want to continue comparing, or add player?"
    input = gets.strip

    if input == "continue comparing"
      call
    elsif input == "add player"
      puts "Which position would you like to add to your team pg, sg, sf, pf or c?"
      position = gets.strip

      add_to_team(position)
    end
  end
end
