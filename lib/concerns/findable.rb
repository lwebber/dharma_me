module Findable

  attr_accessor :title, :teacher, :date, :duration

  def initialize(title, teacher, date, duration)
    @title = title
    @teacher = teacher
    @date = date
    @duration = duration
  end
end
