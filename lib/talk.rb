require './config/environment.rb'


class Talk
  attr_accessor :title, :teacher, :date, :duration, :stream

  # extend Findable::ClassMethods
  # include Findable::InstanceMethods
  @@all = []

  def initialize(title, teacher, date, duration, stream)
    @title = title
    @teacher = teacher
    @date = date
    @duration = duration
    @stream = stream
    @@all << self
  end

  def self.list
    @@all
  end


end
