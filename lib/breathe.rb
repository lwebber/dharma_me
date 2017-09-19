class Breathe

  def self.start
    breathe = ["B", "R", "E", "A", "T", "H", "E"]

    6.times do
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
