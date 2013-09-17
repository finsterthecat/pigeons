class CreateClubs < ActiveRecord::Migration
  def self.up
    create_table :clubs do |t|
      t.string :code, :null => false, :limit => 20
      t.string :name, :null => false, :limit => 100
      t.string :contact, :null => false
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :clubs
  end
end
