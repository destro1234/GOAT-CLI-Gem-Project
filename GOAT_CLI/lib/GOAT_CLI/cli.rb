require 'nokogiri'
require 'pry'
class GOATCLI::CLI

  @@team = {:pg => "", :sg => "", :sf => "", :pf => "", :c => ""}


  def initialize
      make_players
  end

  def call
    puts "The Dream Team was the greatest team of NBA superstars ever formed. Here you can compare players and create your own Dream Team starting 5.\n"
    puts "\n"

    list_players

    puts "\nEnter 1-50, the first player you would like to compare?"
    first_player = gets.strip

    list_players

    puts "\nEnter 1-50, second player you would like to compare?"
    second_player = gets.strip

    puts "\n"
     if first_player.to_i.between?(1, 50)
        GOATCLI::Player.find(first_player).to_s
    puts "\n"

    if second_player.to_i.between?(1, 50) && first_player != second_player
     GOATCLI::Player.find(second_player).to_s
    puts "\n"
    else
      compare
    end
    end
    compare

    puts "Are you done creating your dream team?(yes/no)"
    input = gets.strip
    if input.downcase != "yes"
      call
    end

    @dreamteam = GOATCLI::DreamTeam.new(@@team)
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
      if position == "pg" || position == "sg" || position == "sf" || position == "pf" || position == "c"
      add_to_team(position.downcase)
      @dreamteam.to_s
    else
      compare
    end
    end
  end

  def list_players
    puts "50 Greatest Basketball Players of All Time"
    puts "\n"
    GOATCLI::Player.all.each do |player|
      puts "#{player.index}. #{player.name}, #{player.position}"
    end
  end

  def add_to_team(position)
    puts "Enter 1-50, Which player would you like to add to your team?"
    list_players
    player = gets.strip
    puts "\n"
  if player.to_i.between?(1, 50)
    puts GOATCLI::Player.find(player).to_s
    @@team[:"#{position}"] = GOATCLI::Player.find(player).name
  else
    add_to_team(position)
  end
  end
end
