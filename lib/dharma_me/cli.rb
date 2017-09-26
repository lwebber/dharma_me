class CLI

  def call
    greet
    menu
    goodbye
  end

  def greet
    puts "\nWelcome to DharmaMe!"
    puts "You must be stressed out. Why don't you take a break?"
  end

  def menu
    puts "\nWould you like to (1) Listen to a dharma talk? (2) a Guided Meditation? (3) Just Breathe? Or type q to quit:"

    input = nil
    while input != "q"
    input = gets.strip

    if input.to_i == 1
      puts "Here are your choices today: "
      Talk.reset!
      Talk.create_from_collection(Scraper.scrape_talks("http://imcw.org/Talks"))
      Talk.add_attributes_to_talks
      Talk.list
      
      input = nil
      puts "\nWhich one would you like to hear? (or q to quit, m for main menu)"
      input = gets.strip
        if input != "q" || input != "m"
          talk = Talk.find(input)
          talk.show_details
          talk.play
        elsif input = "m"
          menu
        elsif input = "q"
          goodbye
        end
        
    elsif input.to_i == 2
      puts "Here are your choices today: "
      Meditation.reset!
      Meditation.create_from_collection(Scraper.scrape_meditations("http://marc.ucla.edu/mindful-meditations"))
      Meditation.list
      
      input = nil
      puts "\nWhich one would you like to hear? (or q to quit, m for main menu)"
      input = gets.strip
      if input != "q" || input != "m"
        Meditation.find(input).play
      elsif input = "m"
        menu
      elsif input = "q"
        goodbye
      end
      
    elsif input.to_i == 3
      Breathe.start
      menu
    end
  end

  def goodbye
    puts "Come back tomorrow for updated talks and meditations."
  end
end
end
