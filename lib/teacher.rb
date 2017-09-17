require './config/environment.rb'

class Teacher
  attr_writer :name
  attr_accessor :talks, :meditations

  def initialize(name)
    @name = name
    @talks = []
    @meditations = []
  end

  def add_talk(talk)
    @talks << talk
  end

  def add_meditation(meditation)
    @meditations << meditation
  end

end
