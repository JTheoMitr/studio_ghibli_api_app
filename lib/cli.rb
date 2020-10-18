class CLI

  def start
    puts "Welcome, friend"
    API.fetch_movies
  end

end
