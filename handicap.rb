class Handicap 
  attr_accessor :calculate
  NUM_OF_SCORES_TO_USE = {
    5 => 1,
    6 => 1,
    7 => 2,
    8 => 2,
    9 => 3,
    10 => 3,
    11 => 4,
    12 => 4,
    13 => 5,
    14 => 5,
    15 => 6,
    16 => 6,
    17 => 7,
    18 => 8,
    19 => 9,
    20 => 10
  }
  
  def initialize(rounds=[])
    @rounds = rounds.sort_by! { |r| r.date }
  end
  
  def calculate
    arr_difs = which_scores_to_use.collect {|r| r.differential } 
    handicap = (arr_difs.sum / arr_difs.count) * 0.96
    handicap.round(2)
  end
  
  def which_scores_to_use
    which_rounds_to_use.sort_by! { |r| r.differential }
    which_rounds_to_use.shift(NUM_OF_SCORES_TO_USE[@rounds.count])    
  end
  
  def which_rounds_to_use 
    count = @rounds.count
    if count < 5
      throw_error
    elsif count >= 5 && count <= 20
      @rounds
    elsif count > 20
      num_to_remove = count - 20
      @rounds.shift(num_to_remove)
      @rounds
    end
  end  
end

