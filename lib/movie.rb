class Movie
  attr_accessor :title, :director, :release_date, :rotten_tomatoes, :description

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end


end
