module Recording

  module InstanceMethods
    def initialize(attributes_hash)#takes in hash of recording attributes
      attributes_hash.each {|key, value| self.send(("#{key}="), value)}
      @@all << self
    end

    def play
      print Rainbow("Click the link to play: #{@url}").red
      puts ""
    end
  end

  module ClassMethods
    def create_from_collection(recording_attributes) # takes in array of meditation recording (either talk or meditation) hashes
      recording_attributes.each do |attributes|
        self.new(attributes) #how to change this to subclass method? Is self correct?
      end
    end

    def all #access all the recordings (talks or meditations)
      @@all
    end

    def find(input)
      @@all[input.to_i - 1]
    end

    def reset! #reset all to clear the list
      @@all.clear
    end
  end
  
end
