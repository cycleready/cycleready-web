class AddAboutToNeighborhoods < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :about, :text
  end
end
