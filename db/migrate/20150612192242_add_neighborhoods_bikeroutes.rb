class AddNeighborhoodsBikeroutes < ActiveRecord::Migration
  def self.up
    create_table :bikeroutes_neighborhoods, id: false do |t|
      t.belongs_to :bikeroute, index: true
      t.belongs_to :neighborhood, index: true
    end
  end

  def self.down
    drop_table :bikeroutes_neighborhoods
  end
end
