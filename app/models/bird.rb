class Bird < ActiveRecord::Base
  belongs_to :loft
  has_many :race_entries
end
