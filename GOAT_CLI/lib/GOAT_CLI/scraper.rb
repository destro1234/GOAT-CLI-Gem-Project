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
      stats = "#{player.css('td').text}"
      position = "#{player.css('td')[2]}"
      scraped_players << {:name => name, :position => position, :stats => stats}
    end
    puts scraped_players.uniq
  end

  def self.list_of_players
    index_page = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/50_Greatest_Players_in_NBA_History'))
    table = index_page.css('.wikitable.sortable')[1]
    players = table.css('tbody tr').select do |player|
      name = player.css('span.fn').text
    @@list_of_players << name
  end
  puts @@list_of_players.uniq
  end
end

#list of players  =   table.css('tbody tr').select do |player|
#puts player.css('span.fn').text

    #stats = table.css('tbody tr').each do |players|
      #puts "#{players.css('td').text} "
    #end
