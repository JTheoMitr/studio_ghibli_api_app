class API

  def self.fetch_movies
    url = "https://ghibliapi.herokuapp.com/films"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    binding.pry
    movie_array = JSON.parse(response)

    list_of_titles = movie_array.each { |movie| puts movie["title"] }
    #use collect?

  end



end
