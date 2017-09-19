require './config/environment.rb'

class Meditation
  attr_accessor :title, :stream
  @@all = []

#instance methods

  def initialize(meditation_hash)
    meditation_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def play
    puts "Click the link to play: #{@stream}"
  end

  def self.find_by_input(input)
    @@all[input.to_i - 1]
  end

  #class methods
  def self.create_from_collection(meditation_array) #array of meditation hashes
    meditation_array.each do |meditation_hash|
      Meditation.new(meditation_hash)
    end
  end

  def self.all
    @@all
  end

  def self.list
    self.all.each_with_index { |m, index| puts "#{index + 1}. #{m.title}"}
  end

  def self.reset!
    @@all.clear
  end

end
