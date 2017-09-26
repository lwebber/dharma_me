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
      choice = gets.strip

        if choice == "m"
          menu
        elsif choice == "q"
          goodbye
        else
          talk = Talk.find(choice)
          talk.show_details
          talk.play
          menu
        end

    elsif input.to_i == 2
      puts "Here are your choices today: "
      Meditation.reset!
      Meditation.create_from_collection(Scraper.scrape_meditations("http://marc.ucla.edu/mindful-meditations"))
      Meditation.list

      choice = nil
      puts "\nWhich one would you like to hear? (or q to quit, m for main menu)"
      choice = gets.strip
        if choice == "m"
          menu
        elsif choice == "q"
          goodbye
        else
          Meditation.find(choice).play
          puts "Here's the menu again if you'd like to start over:"
          menu
        end

    elsif input.to_i == 3
      Breathe.start
      menu
    end
  end

  def goodbye
    puts "Come back tomorrow for updated talks and meditations."
    puts ""
  end
end
end
