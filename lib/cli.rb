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
    puts "Would you like to see a list of films?"
    sleep(1)
    puts "Type 'yes' to see the list; hit any other key to exit"

    user_input = gets.strip.downcase

    #if the user says yes

    if user_input == "yes" || user_input == "y"
      puts "Excellent choice!"
      #display list of movies
      display_list_of_movies
    end

  end

  def display_list_of_movies
    sleep(1)
    puts "ALL MOVIES:"
    Movie.all.each.with_index(1) { |movie, index|
      puts "#{index}: #{movie.title}"
    }
  end

end
