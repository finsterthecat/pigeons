class CreateRaceEntries < ActiveRecord::Migration
  def self.up
    create_table :race_entries do |t|
      t.references :race_card, :null => false
      t.references :bird, :null => false
      t.datetime :clocked_at
      t.decimal :avg_speed, :limit => 10000
      t.string :band_num, :limit => 30

      t.timestamps
    end
  end

  def self.down
    drop_table :race_entries
  end
end
