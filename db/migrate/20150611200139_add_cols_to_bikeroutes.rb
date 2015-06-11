class AddColsToBikeroutes < ActiveRecord::Migration
  def change
    add_column :bikeroutes, :lane_type, :string
    add_column :bikeroutes, :grade, :integer
    add_column :bikeroutes, :distance, :decimal
  end
end
