require './config/environment.rb'

class Meditation
  attr_accessor :title, :stream

  def initialize(title, stream)
    @title = title
    @stream = stream
  end

end
