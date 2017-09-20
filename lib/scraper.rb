require './config/environment.rb'


class Scraper

  def self.scrape_talks
    rss = RSS::Parser.parse(index_url, false)
    talks = []
    rss.items.each do |item|
      talk = {
        title: item.title,
        teacher: item.author,
        date: item.pubdate,
        stream: item.url
      }
      talks << talk
    end
    talks
  end

  def self.scrape_teacher(index_url)

  end

  def self.scrape_meditations(index_url)
    meditations = []
    doc = Nokogiri::HTML(open(index_url))
    rows = doc.css("tr")
    recordings = rows[1..8]

    recordings.each do |r|
      stream_xml = r.css("td:nth-child(2)")
      meditation = {
        title: r.css("td:nth-child(1)").text,
        #teacher: ,
        stream: "http://marc.ucla.edu/#{stream_xml.at("a")["href"]}"
      }
      meditations << meditation #return array of meditation attributes hashes
    end
    meditations
  end
end

#Scraper.scrape_talks("http://dharmaseed.org/feeds/recordings/?max-entries=15")
# Scraper.scrape_meditations("http://marc.ucla.edu/mindful-meditations")
# binding.pry
