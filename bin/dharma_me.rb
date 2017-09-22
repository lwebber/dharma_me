require './config/environment.rb'

    puts "\nWelcome to DharmaMe!"
    puts "You must be stressed out. Why don't you take a break?"

    input = nil
    while input != "q"

    puts "\nWould you like to (1) Listen to a dharma talk? (2) a Guided Meditation? (3) Just Breathe? Or type q to quit:"

    input = gets.strip

    if input.to_i == 1
      puts "Here are your choices today: "
      Talk.reset!
      Talk.create_from_collection(Scraper.scrape_talks("http://imcw.org/Talks"))
      Talk.add_attributes_to_talks
      Talk.list
      puts "\nWhich one would you like to hear? (or q to quit, m for main menu)"
      input = gets.strip
      if input != "q" || input != "m"
        talk = Talk.find(input)
        talk.show_details
        talk.play
      end
    elsif input.to_i == 2
      puts "Here are your choices today: "
      Meditation.reset!
      Meditation.create_from_collection(Scraper.scrape_meditations("http://marc.ucla.edu/mindful-meditations"))
      Meditation.list
      puts "\nWhich one would you like to hear? (or q to quit, m for main menu)"
      input = gets.strip
      if input != "q"
        Meditation.find(input).play
      end
    elsif input.to_i == 3
      Breathe.start
    end
  end
