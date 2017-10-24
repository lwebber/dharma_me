class Breathe

  def self.start
    breathe = ["B", "R", "E", "A", "T", "H", "E"]

    3.times do #production version will have more loops. Set at 1 for testing purposes.
      breathe.each do |letter|
        print Rainbow(letter).cyan
        sleep(1)
        print "."
        sleep(1)
        print "."
        sleep(1)
        print "."
        sleep(1)
      end
    end
  end
end
