require 'open-uri'
require 'nokogiri'
require 'pry'

class GOATCLI::Scraper

  def self.scrape_index_page
    binding.pry
    index_page = Nokogiri::HTML(open('http://www.espn.com/nba/story/_/page/nbarankalltime/greatest-players-ever'))
    index_page

  end
end
