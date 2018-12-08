require 'nokogiri'
require 'pry'
class GOATCLI::CLI

  @@team = {:pg => "", :sg => "", :sf => "", :pf => "", :c => ""}

  def call
    make_players

    puts "The Dream Team was the greatest team of NBA superstars ever formed. Here you can compare players and create your own Dream Team starting 5.\n"
    puts "\n"

    list_players
    compare
  end

  def make_players
    scraped_players = GOATCLI::Scraper.new.scrape_players
    scraped_players.shift
    scraped_players.each do |player|
    GOATCLI::Player.new(player)
  end
end

  def compare
    puts "\nEnter 1-50, the first player you would like to compare?"
    first_player_index = gets.strip

    list_players

    puts "\nEnter 1-50, second player you would like to compare?"
    second_player_index = gets.strip

    puts "\n"
    find_by_index(first_player_index)
    puts ""
    find_by_index(second_player_index)

    puts "Do you want to continue comparing or add player?"
    input = gets.strip

    if input == "add player"
      add_by_position
      create_dreamteam
    else
      compare
    end
  end

  def list_players
    puts "50 Greatest Basketball Players of All Time"
    puts "\n"
    GOATCLI::Player.all.each do |player|
      puts "#{player.index}. #{player.name}, #{player.position}"
    end
  end

  def add_by_position
    puts "Which position would you like to add to your team pg, sg, sf, pf or c?"
    position = gets.strip.downcase
    if position == "pg" || position == "sg" || position == "sf" || position == "pf" || position == "c"

      puts "\nEnter 1-50, Which player would you like to add to your team as #{position}?"
      puts ""
      list_players
      player = gets.strip
      puts ""
      find_by_index(player)
      @@team[:"#{position}"] = GOATCLI::Player.find(player).name
      @dreamteam.to_s
  else
    add_by_position
  end
end

def create_dreamteam
  puts "Are you done creating your dream team?(yes/no)"
  input = gets.strip
  if input.downcase == "yes"
    @dreamteam = GOATCLI::DreamTeam.new(@@team)
    puts "\nThis is your Dream Team!"
    @dreamteam.to_s
  else
    compare
  end
end

  def find_by_index(player_index)
    if player_index.to_i.between?(1, 50)
       GOATCLI::Player.find(player_index).to_s
     else
       puts "Enter the number of the player you want to look up."
       input = gets.strip
       find_by_index(input)
    end
 end
end
