class Recording

  def initialize(attributes_hash)#takes in hash of recording attributes
    attributes_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def play
    print Rainbow("Click the link to play: #{@url}").red
    puts ""
  end

  def self.create_from_collection(meditation_attributes) # takes in array of meditation attributes hashes
    meditation_attributes.each do |attributes|
      Meditation.new(attributes) #how to change this to subclass method?
    end
  end

  def self.create_from_collection(talk_attributes) #array of meditation hashes
    talk_attributes.each do |attributes|
      Talk.new(attributes) #how to change this to subclass method?
    end
  end

  def self.all #access all the meditations
    @@all
  end

  def self.find(input)
    @@all[input.to_i - 1]
  end

  def self.reset! #reset all to clear the list
    @@all.clear
  end

end
