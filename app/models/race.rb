class Race < ActiveRecord::Base
  belongs_to :race_station
  has_many :race_cards
end
