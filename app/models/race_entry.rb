class RaceEntry < ActiveRecord::Base
  belongs_to :race_card
  belongs_to :bird
end
