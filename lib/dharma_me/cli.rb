class CLI

  def call
    #main method to run the program
    greet
    menu
    goodbye
  end

  def greet
    #welcome user
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
      #reset all to get and store a fresh scrape.
      Talk.reset!
      #get talks from main page
      Talk.create_from_collection(Scraper.scrape_talks("http://imcw.org/Talks"))
      #add more details from details page. Should I only do this to talk user selects? Would save time.
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
          #could potentially scrape and add the details here.
          talk.show_details
          talk.play
          menu
        end

    elsif input.to_i == 2
      puts "Here are your choices today: "
      #reset all to get and store a fresh scrape
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
      #could make this more flexible and abstract by asking user to input amount of time
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
