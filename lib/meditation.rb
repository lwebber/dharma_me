require './config/environment.rb'

class Meditation
  attr_accessor :title, :stream
  @@all = []

  def initialize(title, stream)
    @title = title
    @stream = stream
    @@all << self
  end

  def play
    puts "Click the link to play: #{@stream}"
  end

  def self.all
    @@all
  end

end
