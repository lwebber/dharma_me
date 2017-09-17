require './config/environment.rb'


puts "Welcome to DharmaMe!"
puts "You must be stressed out. Why don't you take a break to meditate?"
puts "Pick a meditation"

#Meditation.create_from_collection(Scraper.scrape_meditations("http://marc.ucla.edu/mindful-meditations"))
puts "Here are your choices today: "
Meditation.list
