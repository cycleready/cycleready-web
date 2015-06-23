class AddNIdToNeighborhoods < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :slug, :string, :unique=>true
    add_index :neighborhoods, :slug
  end
end
