class Movie
  attr_accessor :title, :director, :release_date, :rotten_tomatoes, :description

  @@all = []
  @@playlist = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.playlist
    @@playlist
  end

end
