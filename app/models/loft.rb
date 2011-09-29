class Loft < ActiveRecord::Base
  belongs_to :club
  has_many :birds
  has_many :race_cards
  has_many :race_distances
end
