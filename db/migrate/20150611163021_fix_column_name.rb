class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :bikeroutes, :title, :name
    rename_column :bikeroutes, :text, :description
  end
end
