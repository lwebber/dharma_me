require './config/environment.rb'


class Talk
  attr_accessor :title, :teacher, :date, :duration

  # extend Findable::ClassMethods
  # include Findable::InstanceMethods

  def initalize(title, teacher, date, duration)
    @title = title
    @teacher = teacher
    @date = date
    @duration = duration
  end


end
