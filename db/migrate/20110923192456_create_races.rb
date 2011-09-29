class CreateRaces < ActiveRecord::Migration
  def self.up
    create_table :races do |t|
      t.references :race_station, :null => false
      t.date :race_date, :null => false
      t.datetime :released_at
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :races
  end
end
