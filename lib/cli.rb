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
    yes_for_list
  end

  def yes_for_list

    puts "Type 'yes' to see the list; hit any other key to exit"

    user_input = gets.strip.downcase

    if user_input == "yes" || user_input == "y"
      puts "Excellent!  Here you are:"
      #display list of movies
      sleep(1)
      display_list_of_movies
      choose_a_movie
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
        puts "Would you like to choose a different movie?"
        yes_for_list
      else
        puts "Sorry, that is not a valid option"
        sleep(1)
        choose_a_movie
      end
        main_menu

  end

  def movie_details(movie)
    puts "Movie Title: " + movie.title
    puts "Directed by " + movie.director
    puts "Released in " + movie.release_date
    puts "Rotten Tomatoes Score:  " + movie.rotten_tomatoes
    puts "Synopsis: " + movie.description
  end

end
