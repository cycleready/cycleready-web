class AddElevationToBikeroutes < ActiveRecord::Migration
  def change
    add_column :bikeroutes, :elevation, :text
  end
end
