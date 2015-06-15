class AddMapToBikeroutes < ActiveRecord::Migration
  def change
    add_column :bikeroutes, :map, :string
  end
end
