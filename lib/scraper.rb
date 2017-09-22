require './config/environment.rb'


class Scraper #should it be class methods or instance methods?

  def self.scrape_talks(index_url)
    doc = Nokogiri::HTML(open(index_url))
    talks = doc.css(".event-item")

    talks.collect do |talk|
      talk_attributes = {
        date: talk.css(".publish-date").text,
        title: talk.css("h3").text,
        url: talk.at("a")["href"]
      }
    end
  end

  def self.scrape_talk_details(index_url) #create another attributes hash to send to the Talk
    doc = Nokogiri::HTML(open(index_url))
    talk_attributes = {
      teacher: doc.css("#dnn_ctr466_ViewTalkDetails_hlTeacher").text,
      description: doc.css(".text-holder").text.gsub("\r", "").gsub("\n", "").gsub("\t","")
    }
    #returns one hash
  end

  def self.scrape_meditations(index_url)
    doc = Nokogiri::HTML(open(index_url))
    rows = doc.css("tr")
    meditations = rows[1..8]

    meditations.collect do |meditation|
      stream_xml = meditation.css("td:nth-child(2)")
      meditation = {
        title: meditation.css("td:nth-child(1)").text,
        url: "http://marc.ucla.edu/#{stream_xml.at("a")["href"]}"
      }
    end
  end
end

# Scraper.scrape_talks("http://imcw.org/Talks")
# Scraper.scrape_meditations("http://marc.ucla.edu/mindful-meditations")
# Scraper.scrape_talk("http://imcw.org/Talks/TalkDetail/TalkID/1136")
# binding.pry
