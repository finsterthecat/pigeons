class RaceStation < ActiveRecord::Base
  has_many :race_distances
  has_many :races
end
