class Round 
  attr_accessor :date, :differential
  def initialize(date, score, rating, slope)
    @date = date
    @score = score.to_i
    @rating = rating.to_f
    @slope = slope.to_i
    @differential = differential
  end
  
  def differential
    ((@score - @rating) * 113) / @slope
  end
end