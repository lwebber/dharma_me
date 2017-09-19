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

  #class methods
  def self.create_from_collection(meditation_array) #array of meditation hashes
    meditation_array.each do |student_hash|
      Meditation.new(meditation_hash)
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

# m1 = Meditation.new("Breathing Meditation (5 mins)", "http://marc.ucla.edu/mpeg/01_Breathing_Meditation.mp3")
#
# m2 = Meditation.new("Breath, Sound, Body Meditation (12 mins)", "http://marc.ucla.edu/mpeg/02_Breath_Sound_Body_Meditation.mp3")
#
# Meditation.list

#binding.pry
