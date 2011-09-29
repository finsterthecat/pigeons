class CreateRaceCards < ActiveRecord::Migration
  def self.up
    create_table :race_cards do |t|
      t.references :loft, :null => false
      t.references :race_distance, :null => false
      t.references :race, :null => false
      t.integer :distance_meters, :limit => 1000000, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :race_cards
  end
end
