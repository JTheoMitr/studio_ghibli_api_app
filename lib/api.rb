class API

  def self.list_movies
    url = "https://ghibliapi.herokuapp.com/films"
    binding.pry
    uri = URI(url)
    response = Net::HTTP.get(uri)

  end

end
