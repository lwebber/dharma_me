
class Meditation
  include Recording::InstanceMethods
  extend Recording::ClassMethods

  attr_accessor :title, :teacher, :url, :date
  @@all = []

  #instance methods

  # def initialize(attributes_hash)#takes in hash of meditation attributes
  #   attributes_hash.each {|key, value| self.send(("#{key}="), value)}
  #   @@all << self
  # end

  # def play
  #   print Rainbow("Click the link to play: #{@url}").red
  #   puts ""
  # end

  #class methods
  # def self.create_from_collection(meditation_attributes) # takes in array of meditation attributes hashes
  #   meditation_attributes.each do |attributes|
  #     Meditation.new(attributes)
  #   end
  # end

  # def self.all #access all the meditations
  #   @@all
  # end

  def self.list #list the meditations for the user
    self.all.each_with_index { |m, index| puts "#{index + 1}. #{m.title}"}
  end

  # def self.find(input) #find a meditation by user input
  #   @@all[input.to_i - 1]
  # end

  # def self.reset! #reset all to clear the list
  #   @@all.clear
  # end

end
