class CLI

  def start
    puts "Fetching Data..."
    API.fetch_movies
    self.greeting
    self.main_menu
  end

  def greeting
    #greet user
    sleep(1)
    puts "Welcome to the world of Studio Ghibli!"
  end

  def main_menu
    #ask if they want to see a list of movies, main console
    sleep(1)
    puts " "
    puts "Would you like to see a list of our films?"
    all_or_playlist
  end

  def all_or_playlist

    puts "Type 'all' to see the full list of our movies, or 'playlist' to see your current playlist; hit any other key to exit"

    user_input = gets.strip.downcase

    if user_input == "all"
      puts "Excellent!  Here you are:"
      #display list of movies
      sleep(1)
      display_list_of_movies
      choose_a_movie
    elsif user_input == "playlist"
      puts "Ok, here is your current playlist:"
      display_playlist
    else
      puts "Okay, come back soon!"
      sleep(1)
      exit(true)
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
      puts "You have not added any movies to your playlist"
      main_menu
    else
    Movie.playlist.each.with_index(1) { |movie, index|
      puts "#{index}: #{movie.title}"
    }
    end
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
        sleep(3)
        puts " "
        puts "Would you like to choose a different movie?"
        all_or_playlist
      else
        puts "Sorry, that is not a valid option"
        sleep(1)
        choose_a_movie
      end
        main_menu

  end

  def add_movie_to_playlist(movie)
    puts "Would you like to add this movie to your playlist?"
    user_input = gets.strip.downcase
    if user_input == "yes" || user_input == "y"
      add_to_playlist(movie)
    elsif user input == "no" || user_input == "n"
      puts "Ok, your playlist will remain as is."
      all_or_playlist
    else
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

  def movie_details(movie)
    puts "Movie Title: " + movie.title
    puts "Directed by " + movie.director
    puts "Released in " + movie.release_date
    puts "Rotten Tomatoes Score:  " + movie.rotten_tomatoes
    puts "Synopsis: " + movie.description
    sleep(2)
    puts " "
    add_movie_to_playlist(movie)
  end

end
