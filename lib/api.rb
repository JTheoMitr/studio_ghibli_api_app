class API

  def self.list_movies
    url = "https://ghibliapi.herokuapp.com/films"
    binding.pry
    uri = URI(url)
    response = Net::HTTP.get(uri)
    movie_hash = JSON.parse(response)

    list_of_titles = movie_hash.each { |movie| movie["title"] }
    #use collect?

  end



end
