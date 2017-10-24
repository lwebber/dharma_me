require_relative './recording.rb'

class Talk
  include Recording::InstanceMethods
  extend Recording::ClassMethods

  attr_accessor :date, :title, :url, :teacher, :description

  @@all = []

  def initialize(attributes_hash)
    #initialize a talk object with a hash of attributes
    attributes_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def add_attributes(talk_attributes)
    #add attributes from a hash to a single talk
    #used below in #add_attributes_to_talks
    talk_attributes.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.add_attributes_to_talks
    #add attributes from a talk's details page to current list of talks
    self.all.each do |talk|
      attributes = Scraper.scrape_talk_details(talk.url)
      talk.add_attributes(attributes)
    end
  end

  def show_details
    #show date and description of talk
    puts ""
    puts "Date: #{@date}"
    puts ""
    puts "Description #{@description}"
    puts ""
  end

  def self.all
    #access all talk objects
    @@all
  end

  def self.list
    #list talk choices
    self.all.each_with_index { |t, index| puts "#{index + 1}. #{t.title} by #{t.teacher}"}
  end

end
