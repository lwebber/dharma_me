require './config/environment.rb'

class Meditation
  attr_accessor :title :stream

  def initalize(title, stream)
    @title = title
    @stream = stream
  end

end
