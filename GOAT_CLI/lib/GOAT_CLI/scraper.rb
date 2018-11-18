require 'open-uri'
require 'nokogiri'
require 'pry'

class GOATCLI::Scraper

  def self.scrape_players
    scraped_players = []
    index_page = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/50_Greatest_Players_in_NBA_History'))
    table = index_page.css('.wikitable.sortable')[1]
    players = table.css('tbody tr').each do |player|
      name = player.css('span.fn').text
      stats = "#{player.css('td').text}"
      scraped_players << {:name => name, :stats => stats}
    end
    puts scraped_players.uniq
  end
end

#list of players  =   table.css('tbody tr').select do |player|
#puts player.css('span.fn').text

    #stats = table.css('tbody tr').each do |players|
      #puts "#{players.css('td').text} "
    #end
