class RaceStation < ActiveRecord::Base
  has_many :race_distances
  has_many :races

  def all_race_distances
    dists = race_distances.inject({}) do |h,d|
      d[:id] = nil
      h[d.loft.id] = d
      h
    end
    Loft.all.each do |loft|
      dists[loft.id] ||=
        RaceDistance.new(
          :race_station => self,
          :loft => loft,
          :distance_meters => 0)
    end
    dists.sort.map {|x| x[1]}
  end

  #Race distance for a station
  def race_distance_for_loft(loft_id)
    RaceDistance.
      find_by_race_station_id_and_loft_id(self.id,
                                          loft_id)
  end

  # Update race distance (add a new one if not found)
  def update_race_distance(loft_id, distance_meters)
    rsd = race_distance_for_loft(loft_id)
    if rsd
      rsd.distance_meters = distance_meters
    else
      rsd = RaceDistance.new(
        :race_station => self, 
        :loft => Loft.find(loft_id),
        :distance_meters => distance_meters)
    end
    rsd.save
  end
end
