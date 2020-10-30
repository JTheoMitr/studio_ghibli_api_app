class CLI

  def start
    puts "Fetching Data..."
    API.fetch_movies
    sleep(1)
    puts "Welcome to the world of Studio Ghibli!"
    self.main_menu
  end

  def main_menu

    sleep(1)
    puts " "
    puts "Type 'all' to see the full list of our movies"
    puts "Type 'playlist' to see your current playlist"
    puts "Type 'exit' to exit the application"

    user_input = gets.strip.downcase

    if user_input == "all"
      puts " "
      puts "OK, here is our full library:"
      sleep(1)
      puts " "
      display_list_of_movies
      choose_a_movie
    elsif user_input == "playlist"
      puts " "
      sleep(1)
      puts "Ok, here is your current playlist:"
      puts " "
      display_playlist
    elsif user_input == "exit"
      puts " "
      sleep(1)
      puts "Okay, come back soon!"
      sleep(1)
      exit(true)
    else
      puts " "
      sleep(1)
      puts "Sorry, I don't understand that command"
      main_menu
    end

  end

  def display_list_of_movies
    sleep(1)
    puts "ALL STUDIO GHIBLI MOVIES:"
    Movie.all.each.with_index(1) { |movie, index|
      puts "#{index}: #{movie.title}"
    }
  end

  def display_playlist
    sleep(1)
    if Movie.playlist == []
      puts "There are no movies in your playlist"
      sleep(1)
      main_menu
    else
    Movie.playlist.each.with_index(1) { |movie, index|
      puts "#{index}: #{movie.title}"
    }
    sleep(1)
    clear_playlist
    end
    main_menu
  end

  def choose_a_movie
      puts "Please enter the number of the movie you're interested in learning more about"
      user_input = gets.strip.to_i - 1
      current_movie = Movie.all[user_input]
      if user_input.between?(0, Movie.all.length - 1)
        puts "Great Choice!"
        sleep(1)
        puts " "
        movie_details(current_movie)
      else
        puts "Sorry, that is not a valid option"
        sleep(1)
        choose_a_movie
      end
        main_menu

  end

  def add_movie_to_playlist?(movie)
    puts "Would you like to add this movie to your playlist? (yes or no)"
    user_input = gets.strip.downcase
    if user_input == "yes" || user_input == "y"
      add_to_playlist(movie)
    elsif user_input == "no" || user_input == "n"
      puts "Ok, your playlist will remain as is."
      sleep(1)
      puts " "
      main_menu
    else
      sleep(1)
      puts "Sorry, I didn't catch that"
      add_movie_to_playlist?(movie)
    end

  end

  def add_to_playlist(movie)
    if Movie.playlist.include?(movie)
      sleep(1)
      puts "This movie is already in your playlist"
      sleep(1)
    else
      Movie.playlist << movie
      sleep(1)
      puts "OK, this movie has been added to your playlist"
      sleep(1)
    end
    main_menu
  end

  def clear_playlist
    puts " "
    puts "Would you like to clear your playlist? (yes or no)"
    user_input = gets.strip.downcase
    if user_input == "yes" || user_input == "y"
    Movie.playlist.clear
    puts "Playlist has been reset."
    elsif user_input == "no" || user_input == "n"
    puts "Ok, returning to main menu"
    else
      puts "Sorry, I didn't catch that"
      clear_playlist
    end

    sleep(2)
    main_menu
  end

  def movie_details(movie)
    puts "Movie Title: " + movie.title
    puts "Directed by " + movie.director
    puts "Released in " + movie.release_date
    puts "Rotten Tomatoes Score:  " + movie.rotten_tomatoes
    puts "Synopsis: " + movie.description
    sleep(2)
    puts " "
    add_movie_to_playlist?(movie)
  end

end
