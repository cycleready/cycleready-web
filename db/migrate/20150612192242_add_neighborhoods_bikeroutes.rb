class AddNeighborhoodsBikeroutes < ActiveRecord::Migration
  def self.up
    create_table :bikeroutes_neighborhoods, :id => false do |t|
      t.integer :bikeroute_id
      t.integer :neighborhod_id
    end
  end

  def self.down
    drop_table :bikeroutes_neighborhoods
  end
end
