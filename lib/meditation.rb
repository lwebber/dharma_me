require './config/environment.rb'

class Meditation
  attr_accessor :title, :stream

  def initialize(title, stream)
    @title = title
    @stream = stream
  end

  def play
    puts "Click the link to play"
    puts @stream
  end

end

meditation = Meditation.new("sample", "http://marc.ucla.edu/mpeg/01_Breathing_Meditation.mp3")
