require './config/environment.rb'


puts "Welcome to DharmaMe!"
puts "You must be stressed out. Why don't you take a break?"

input = nil
while input != "q"

puts "Would you like to (1) Listen to a dharma talk? (2) Meditate or (3) Just Breathe? Or type q to quit:"

input = gets.strip

  if input.to_i == 1
    puts "Here are your choices today: "
    Talk.list
  elsif input.to_i == 2
    puts "Here are your choices today: "
    Meditation.create_from_collection(Scraper.scrape_meditations("http://marc.ucla.edu/mindful-meditations"))
    Meditation.list
    puts "Which one would you like to hear?"
    input = gets.strip
    Meditation.find_by_input(input).play
  elsif input.to_i == 3   
    Breathe.start
  else
    puts "Not sure what you want?"
  end
end
