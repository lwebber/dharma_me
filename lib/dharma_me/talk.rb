require './config/environment.rb'


class Talk
  attr_accessor :date, :title, :url, :teacher, :description


  @@all = []

  #instance methods
  def initialize(attributes_hash)
    attributes_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def add_attributes(talk_attributes) #one hash instead of an array of hashes?
    talk_attributes.each {|key, value| self.send(("#{key}="), value)}
  end

  def show_details
    puts ""
    puts "Date: #{@date}"
    puts ""
    puts "Description #{@description}"
    puts ""
  end

  def play
    print Rainbow("Click the link to play: #{@url}").red
    puts ""
    puts ""
    puts ""
  end

  #class methods
  def self.create_from_collection(talk_attributes) #array of meditation hashes
    talk_attributes.each do |attributes|
      Talk.new(attributes)
    end
  end

  def self.add_attributes_to_talks
    Talk.all.each do |talk|
      attributes = Scraper.scrape_talk_details(talk.url)
      talk.add_attributes(attributes)
    end
  end

  def self.all
    @@all
  end

  def self.list
    self.all.each_with_index { |t, index| puts "#{index + 1}. #{t.title} by #{t.teacher}"}
  end

  def self.reset!
    @@all.clear
  end

  def self.find(input)
    @@all[input.to_i - 1]
  end

end
