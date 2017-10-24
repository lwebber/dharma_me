module Recording

  module InstanceMethods

    def play
      print Rainbow("Click the link to play: #{@url}").red
      puts ""
    end
  end

  module ClassMethods

    def create_from_collection(attributes)
      #takes in array of attributes hashes
      attributes.each do |attributes|
        self.new(attributes)
      end
    end

    def list
      #list the recordings for the user
      all.each_with_index { |m, index| puts "#{index + 1}. #{m.title}"}
    end

    def find(input)
      #find a recordings by user input
      all[input.to_i - 1]
    end

    def reset!
      #reset all to clear the list
      all.clear
    end
  end

end
