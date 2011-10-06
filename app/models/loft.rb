class Loft < ActiveRecord::Base
  belongs_to :club
  has_many :birds
  has_many :race_cards
  has_many :race_distances

  def all_race_distances
    dists = race_distances.inject({}) do |h,d|
      d[:id] = nil
      h[d.race_station.id] = d
      h
    end
    RaceStation.all.each do |station|
      dists[station.id] ||= 
        RaceDistance.new(
          :race_station => station,
          :loft => self,
          :distance_meters => 0)
    end
    dists.sort.map {|x| x[1]}
  end

  #Race distance for a station
  def race_distance_for_station(station_id)
    RaceDistance.
      find_by_race_station_id_and_loft_id(station_id,
                                          self.id)
  end

  # Update race distance (add a new one if not found)
  def update_race_distance(station_id, distance_meters)
    rsd = race_distance_for_station(station_id)
    if rsd
      rsd.distance_meters = distance_meters
    else
      rsd = RaceDistance.new(
        :race_station => RaceStation.find(station_id), 
        :loft => self,
        :distance_meters => distance_meters)
    end
    rsd.save
  end

end
