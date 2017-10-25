class Breathe

  def self.start
    breathe = ["B", "R", "E", "A", "T", "H", "E"]

    1.times do #production version can have more loops. Set at 1 for testing purposes. Could modify to have user select amount of time for breathing.
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
