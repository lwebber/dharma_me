class Teacher
  attr_writer :name
  attr_accessor :talks, :meditations

  def initialize(name)
    @name = name
    talks = []
    meditations = []
  end

end
