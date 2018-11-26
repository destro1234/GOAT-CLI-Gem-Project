require 'open-uri'
require 'nokogiri'
require 'pry'

class GOATCLI::Scraper

  @@list_of_players = []

  def self.scrape_players
    scraped_players = []
    index_page = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/50_Greatest_Players_in_NBA_History'))
    table = index_page.css('.wikitable.sortable')[1]
    players = table.css('tbody tr').each do |player|

      name = player.css('span.fn').text
      position = player.css('td')[2].text.chomp if player.css('td')[2]
      teams_played_for = player.css('td')[1].text.chomp if player.css('td')[1]

      scraped_players << {:name => name, :position => position, :teams_played_for => teams_played_for}
    end
    scraped_players.uniq
  end

  def self.list_of_players
    list_of_players = []
    index_page = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/50_Greatest_Players_in_NBA_History'))
    table = index_page.css('.wikitable.sortable')[1]
    players = table.css('tbody tr').each_with_index do |player, index|
      name = player.css('span.fn').text if player.css('span.fn').text
    list_of_players << "#{index}. #{name}"
  end
  list_of_players.shift
  list_of_players.uniq
  end
end

#list of players  =   table.css('tbody tr').select do |player|
#puts player.css('span.fn').text

    #stats = table.css('tbody tr').each do |players|
      #puts "#{players.css('td').text} "
    #end
