class CreateRaceDistances < ActiveRecord::Migration
  def self.up
    create_table :race_distances do |t|
      t.references :loft, :null => false
      t.references :race_station, :null => false
      t.integer :distance_meters, :null => false, :limit => 1000000

      t.timestamps
    end
  end

  def self.down
    drop_table :race_distances
  end
end
