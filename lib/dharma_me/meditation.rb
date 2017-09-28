
require_relative './recording.rb'

class Meditation

  include Recording::InstanceMethods
  extend Recording::ClassMethods

  attr_accessor :title, :teacher, :url, :date
  @@all = []

  def initialize(attributes_hash)
    #takes in hash of meditation attributes to build a meditation object
    attributes_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  # def self.create_from_collection(meditation_attributes)
  #   #takes in array of meditation attributes hashes
  #   meditation_attributes.each do |attributes|
  #     self.new(attributes)
  #   end
  # end

  # def play
  #   print Rainbow("Click the link to play: #{@url}").red
  #   puts ""
  # end

  def self.all
    #access all the meditations
    @@all
  end

  # def self.list
  #   #list the meditations for the user
  #   self.all.each_with_index { |m, index| puts "#{index + 1}. #{m.title}"}
  # end
  #
  # def self.find(input)
  #   #find a meditation by user input
  #   self.all[input.to_i - 1]
  # end
  #
  # def self.reset!
  #   #reset all to clear the list
  #   self.all.clear
  # end

end
