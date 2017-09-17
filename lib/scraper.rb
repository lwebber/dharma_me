require './config/environment.rb'


class Scraper

  # def get
  #   html = open("https://flatironschool.com/")
  #   doc = Nokogiri::HTML(html)
  #   doc.css(".site-header__hero__headline")
  # end

  # html = open("https://flatironschool.com")
  # doc = Nokogiri::HTML(html)
  # doc.css(".site-header__hero__headline")
  # puts doc.css(".site-header__hero__headline").text


  def self.scrape_talk
    html = open("http://www.audiodharma.org")
    doc = Nokogiri::HTML(html)
    title = doc.css("div.talk-title")
    binding.pry
  end

  def self.scrape_meditation

  end

end

Scraper.scrape_talk
