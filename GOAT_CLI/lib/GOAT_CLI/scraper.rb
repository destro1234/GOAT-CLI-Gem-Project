require 'open-uri'
require 'nokogiri'
require 'pry'

class GOATCLI::Scraper

  @@list_of_players = []

  def scrape_players
    scraped_players = []
    index_page = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/50_Greatest_Players_in_NBA_History'))
    table = index_page.css('.wikitable.sortable')[1]
    players = table.css('tbody tr').each_with_index do |player, index|

      name = player.css('span.fn').text
      teams_played_for = player.css('td')[1].text.chomp if player.css('td')[1]
      position = player.css('td')[2].text.chomp if player.css('td')[2]
      points = player.css('td')[3].text.chomp if player.css('td')[3]
      rebounds = player.css('td')[4].text if player.css('td')[4]
      assists = player.css('td')[5].text if player.css('td')[5]
      championships_won = player.css('td')[6].text if player.css('td')[6]
      all_star_nominations = player.css('td')[9].text if player.css('td')[9]

      scraped_players << {:index => index, :name => name, :teams_played_for => teams_played_for, :position => position, :points => points, :rebounds => rebounds, :assists => assists, :championships_won => championships_won, :all_star_nominations => all_star_nominations}
    end
    scraped_players.uniq
  end


#list of players  =   table.css('tbody tr').select do |player|
#puts player.css('span.fn').text

    #stats = table.css('tbody tr').each do |players|
      #puts "#{players.css('td').text} "
    #end
end
