class CreateBirds < ActiveRecord::Migration
  def self.up
    create_table :birds do |t|
      t.references :loft
      t.string :band_num, :null => false, :limit => 30
      t.date :born_on
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :birds
  end
end
