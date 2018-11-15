require 'open-uri'
require 'nokogiri'
require 'pry'

class GOATCLI::Scraper

  def self.scrape_point_guard
    point_guard_index_page = Nokogiri::HTML(open('http://www.espn.com/nba/story/_/page/nbarankPGs/ranking-top-10-point-guards-ever'))
    point_guards = point_guard_index_page.css('div .article-body h2').map {|pg| pg.text}
    puts point_guards
  end

  def self.scrape_shooting_guard
    shooting_guard_index_page = Nokogiri::HTML(open('http://www.espn.com/nba/story/_/page/nbarankSGs/ranking-top-10-shooting-guards-ever'))
    shooting_guards = shooting_guard_index_page.css('div .article-body h2').map {|sg| sg.text}
    puts shooting_guards
  end

  def self.scrape_small_forward
    small_forward_index_page = Nokogiri::HTML(open('http://www.espn.com/nba/story/_/page/nbarankSFs/ranking-top-10-small-forwards-ever'))
    small_forwards = small_forward_index_page.css('div .article-body h2').map {|sf| sf.text}
    puts small_forwards
  end

  def self.scrape_power_forward
    power_forward_index_page = Nokogiri::HTML(open('http://www.espn.com/nba/story/_/page/nbarankPFs/ranking-greatest-power-forwards-nba-history'))
    power_forwards = power_forward_index_page.css('div .article-body h2').map {|pf| pf.text}
    puts power_forwards
  end

  def self.scrape_center
    centers_index_page = Nokogiri::HTML(open('http://www.espn.com/nba/story/_/page/nbarankCs/ranking-greatest-centers-nba-history'))
    centers = []
    centers_index_page.css('div .article-body h2').each do |center|
    puts centers
    puts "Enter the first player you would like to compare?"
    input = gets.strip
    puts centers.detect {|c| c.include?(input)}
    puts "Enter the second player you would like to compare?"
    input_2 = gets.strip
    puts centers.detect {|c| c.include?(input_2)}
end
  end
end
