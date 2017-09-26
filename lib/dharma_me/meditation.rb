
class Meditation

  attr_accessor :title, :teacher, :url, :date
  @@all = []

  #instance methods

  def initialize(attributes_hash)#takes in the return of #scrape_meditations
    attributes_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def play
    print Rainbow("Click the link to play: #{@url}").red
    puts ""
  end

  #class methods
  def self.create_from_collection(meditation_attributes) #array of meditation hashes
    meditation_attributes.each do |attributes|
      Meditation.new(attributes)
    end
  end

  def self.all
    @@all
  end

  def self.list
    self.all.each_with_index { |m, index| puts "#{index + 1}. #{m.title}"}
  end

  def self.find(input)
    @@all[input.to_i - 1]
  end

  def self.reset!
    @@all.clear
  end

end
