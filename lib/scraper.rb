require './config/environment.rb'


class Scraper

  # def self.get
  #   html = open("https://flatironschool.com/")
  #   doc = Nokogiri::HTML(html)
  #   doc.css(".site-header__hero__headline")
  #   binding.pry
  # end

  # html = open("https://flatironschool.com")
  # doc = Nokogiri::HTML(html)
  # doc.css(".site-header__hero__headline")
  # puts doc.css(".site-header__hero__headline").text

  # def self.scrape_index_page(index_url)
  #   students = [] #will hold array of student hashes
  #   doc = Nokogiri::HTML(open(index_url)) #gets the page
  #   cards = doc.css(".student-card") #array of student cards
  #   cards.each do |card| #build hash of each student and store in array
  #     student = {name: card.css(".student-name").text,
  #       location: card.css(".student-location").text,
  #       profile_url: card.at("a")["href"]
  #     }
  #     students << student# save each student hash into array
  #   end
  #   students #return the array
  # end


  def self.scrape_talks(index_url)
    #return an array of talks (as hashes) from audiodharma
    #will hold the array of talk hashes
    # doc = Nokogiri::XML(RestClient.get(index_url))
    # talks = doc.css(".regularitem")
    open(index_url) do |rss|
      feed = RSS::Parser.parse(rss)
      puts "Title: #{feed.channel.title}"
      feed.items.each do |item|
        puts "Item: #{item.title}"
      end
    binding.pry
  end
end

  def self.scrape_meditations(index_url)
    meditations = []
    doc = Nokogiri::HTML(open(index_url))
    rows = doc.css("tr")
    recordings = rows[1..8]

    first_title = recordings[1].css("td:nth-child(1)").text
    first_stream_xml = recordings[1].css("td:nth-child(2)")
    first_stream_link = "http://marc.ucla.edu/#{first_stream_xml.at("a")["href"]}"

    meditation = Meditation.new(first_title, first_stream_link)
    #binding.pry
  end

end

#Scraper.scrape_talks("https://feeds.feedburner.com/audiodharma")
#Scraper.scrape_meditations("http://marc.ucla.edu/mindful-meditations")
#binding.pry
