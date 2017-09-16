class Teacher
  attr_writer :name
  @@talks = []
  @@meditations = []

  def initialize(name)
    @name = name
  end
end
