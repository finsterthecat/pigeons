class CreateRaceStations < ActiveRecord::Migration
  def self.up
    create_table :race_stations do |t|
      t.string :code, :limit => 20
      t.string :name, :limit => 100
      t.decimal :lat, :limit => 90
      t.decimal :long, :limit => 90

      t.timestamps
    end
  end

  def self.down
    drop_table :race_stations
  end
end
