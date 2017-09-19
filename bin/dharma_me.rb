require './config/environment.rb'


puts "Welcome to DharmaMe!"
puts "You must be stressed out. Why don't you take a break?"

while input != "Q"

puts "Would you like to (1) Listen to a dharma talk? (2) Meditate or (3) Just Breathe? Or type Q to quit:"

input = gets.strip

  case input
  when input.to_i == 1
    puts "Here are your choices today: "
  when input.to_i == 2
    puts "Here are your choices today: "
    Meditation.list
  when input.to_i == 3
    Breathe.start
  end
end




#Meditation.create_from_collection(Scraper.scrape_meditations("http://marc.ucla.edu/mindful-meditations"))
