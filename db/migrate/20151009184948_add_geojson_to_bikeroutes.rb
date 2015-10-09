class AddGeojsonToBikeroutes < ActiveRecord::Migration
  def change
    add_column :bikeroutes, :geojson, :text
  end
end
