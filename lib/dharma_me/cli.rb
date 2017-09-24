class DharmaMe::CLI

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
      DharmaMe::Talk.reset!
      DharmaMe::Talk.create_from_collection(DharmaMe::Scraper.scrape_talks("http://imcw.org/Talks"))
      DharmaMe::Talk.add_attributes_to_talks
      DharmaMe::Talk.list
      puts "\nWhich one would you like to hear? (or q to quit, m for main menu)"
      input = gets.strip
      if input != "q" || input != "m"
        talk = DharmaMe::Talk.find(input)
        talk.show_details
        talk.play
      end
    elsif input.to_i == 2
      puts "Here are your choices today: "
      DharmaMe::Meditation.reset!
      DharmaMe::Meditation.create_from_collection(DharmaMe::Scraper.scrape_meditations("http://marc.ucla.edu/mindful-meditations"))
      DharmaMe::Meditation.list
      puts "\nWhich one would you like to hear? (or q to quit, m for main menu)"
      input = gets.strip
      if input != "q" || input != "m"
        DharmaMe::Meditation.find(input).play
      end
    elsif input.to_i == 3
      DharmaMe::Breathe.start
    end
  end

  def goodbye
    puts "Come back tomorrow for updated talks and meditations."
  end

end
