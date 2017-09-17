require './config/environment.rb'


class Talk
  attr_accessor :title, :teacher, :date, :duration, :stream

  # extend Findable::ClassMethods
  # include Findable::InstanceMethods

  def initalize(title, teacher, date, duration, stream)
    @title = title
    @teacher = teacher
    @date = date
    @duration = duration
    @stream = stream
  end


end
