class API

  def self.fetch_movies
    url = "https://ghibliapi.herokuapp.com/films"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    movie_array = JSON.parse(response)

    movie_array.each { |movie_hash|

      movie = Movie.new
      movie.title = movie_hash["title"]
      movie.director = movie_hash["director"]
      movie.release_date = movie_hash["release_date"]
      movie.rotten_tomatoes = movie_hash["rt_score"]
      movie.description = movie_hash["description"]
    }

  end

end
