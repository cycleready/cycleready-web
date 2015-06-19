class AddTwitterSearchToBikeroutes < ActiveRecord::Migration
  def change
    add_column :bikeroutes, :twitter_search, :text
  end
end
