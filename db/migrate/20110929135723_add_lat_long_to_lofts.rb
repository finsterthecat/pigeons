class AddLatLongToLofts < ActiveRecord::Migration
  def self.up
    add_column :lofts, :lat, :decimal, :limit => 90
    add_column :lofts, :long, :decimal, :limit => 90
  end

  def self.down
    remove_column :lofts, :lat
    remove_column :lofts, :long
  end
end
