require './config/environment.rb'


class Talk
  attr_accessor :title, :teacher, :date, :stream

  @@all = []

#instance methods
  def initialize(attributes_hash)
    attributes_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def play
    puts "Click the link to play: #{@stream}"
  end

#class methods
  def self.all
    @@all
  end

  def self.list
    self.all.each_with_index { |t, index| puts "#{index + 1}. #{t.title}"}
  end

  def self.reset!
    @@all.clear
  end

end
