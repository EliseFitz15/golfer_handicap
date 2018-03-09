require 'csv'
require_relative 'round'
require_relative 'handicap'

rounds = CSV.readlines('rounds.csv', headers: true)
golfers_rounds = []

rounds.each do |round|
  round_date = Date.strptime(round['DATE'], "%m/%d/%Y")
  golfers_rounds << Round.new(round_date, round['SCORE'], round['RATING'], round['SLOPE'])
end

golfers_handicap = Handicap.new(golfers_rounds)
puts golfers_handicap.calculate


