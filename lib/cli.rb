class CLI

  def start
    puts "Fetching Data..."
    API.fetch_movies
    self.main_menu
  end

  def main_menu
    #greet user, ask if they want to see a list of movies
    sleep(1)
    puts "Welcome to the world of Studio Ghibli!"
    sleep(1)
    puts "Would you like to see a list of our films?"
    sleep(1)
    puts "Type 'yes' to see the list; hit any other key to exit"

    user_input = gets.strip.downcase

    #if the user says yes

    if user_input == "yes" || user_input == "y"
      puts "Excellent!  Here you are:"
      #display list of movies
      display_list_of_movies
      choose_a_movie
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
      user_input = gets.strip.to_i
      if user_input
        puts "Great Choice!"
        sleep(1)
        puts " "
        puts "Movie Title: " + Movie.all[user_input].title
        puts "Directed by " + Movie.all[user_input].director
        puts "Released in " + Movie.all[user_input].release_date
        puts "Rotten Tomatoes Score:  " + Movie.all[user_input].rotten_tomatoes
        puts "Synopsis: " + Movie.all[user_input].description
      else
        "Sorry, please enter a number"
      end

      puts "Would you like to choose a different movie?"

  end

end
