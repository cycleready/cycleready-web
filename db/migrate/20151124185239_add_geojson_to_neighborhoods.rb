class AddGeojsonToNeighborhoods < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :geojson, :text
  end
end
