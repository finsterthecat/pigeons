class RaceDistance < ActiveRecord::Base
  belongs_to :race_station
  belongs_to :loft
end
