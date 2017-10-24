class Scraper

  #goes to main page and scrapes the talks
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

 #goes to details page of a talk and gets more info
  def self.scrape_talk_details(index_url) #create another attributes hash to send to the Talk
    doc = Nokogiri::HTML(open(index_url))
    talk_attributes = {
      teacher: doc.css("#dnn_ctr466_ViewTalkDetails_hlTeacher").text,
      description: doc.css(".text-holder").text.gsub("\r", "").gsub("\n", "").gsub("\t","")
    }
    #returns one hash
  end

  #goes to meditation page and collects meditations
  def self.scrape_meditations(index_url)
    doc = Nokogiri::HTML(open(index_url))
    rows = doc.css("tr")
    meditations = rows[1..8]
    #limitation: only collects first 8 rows - not dynamic
    meditations.collect do |meditation|
      stream_xml = meditation.css("td:nth-child(2)")
      meditation = {
        title: meditation.css("td:nth-child(1)").text,
        url: "http://marc.ucla.edu/#{stream_xml.at("a")["href"]}"
      }
    end
  end
end
