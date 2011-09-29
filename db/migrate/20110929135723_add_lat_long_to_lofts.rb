class AddLatLongToLofts < ActiveRecord::Migration
  def self.up
    add_column :lofts, :lat, :decimal
    add_column :lofts, :long, :decimal
  end

  def self.down
    remove_column :lofts, :lat
    remove_column :lofts, :long
  end
end
