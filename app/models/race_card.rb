class RaceCard < ActiveRecord::Base
  belongs_to :loft
  belongs_to :race
  belongs_to :race_distance
  has_many :race_entries
end
