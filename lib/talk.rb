require './config/environment.rb'


class Talk
  attr_accessor :date, :title, :url, :teacher, :description

  @@all = []

  #instance methods
  def initialize(talk_attributes)
    talk_attributes.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def add_attributes(talk_attributes)
    talk_attributes.each {|key, value| self.send(("#{key}="), value)}
  end

  def play
    puts "Click the link to play: #{@stream}"
  end

  #class methods
  def self.create_from_collection(talk_attributes) #array of meditation hashes
    talk_attributes.each do |talk_attributes|
      Meditation.new(talk_attributes)
    end
  end
#how to add the attributes from the details pages?

  def self.all
    @@all
  end

  def self.list
    self.all.each_with_index { |t, index| puts "#{index + 1}. #{t.title}"}
  end

  def self.reset!
    @@all.clear
  end

  #needs find method

end
