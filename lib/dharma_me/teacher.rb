class DharmaMe::Teacher
  attr_accessor :name, :recordings

  def initialize(name)
    @name = name
    @recordings = []
  end

  def add_recording(recording)
    @recordings << recording
  end

end
