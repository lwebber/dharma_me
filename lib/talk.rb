require './config/environment.rb'


class Talk
  attr_accessor :title, :teacher, :date, :duration, :stream

  @@all = []

#instance methods
  def initialize(title, teacher, date, duration, stream)
    @title = title
    @teacher = teacher
    @date = date
    @duration = duration
    @stream = stream
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
