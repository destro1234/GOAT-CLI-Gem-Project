require 'open-uri'
require 'nokogiri'

class DreamTeamScraper

  def self.scrape_index_page
    index_page = Nokogiri::HTML(open('http://www.espn.com/nba/story/_/page/nbarankalltime/greatest-players-ever'))
    index_page

  end
end
