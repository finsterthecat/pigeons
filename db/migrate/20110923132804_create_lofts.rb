class CreateLofts < ActiveRecord::Migration
  def self.up
    create_table :lofts do |t|
      t.references :club
      t.string :name, :null => false, :limit => 100
      t.string :owner, :null => false, :limit => 100
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :lofts
  end
end
