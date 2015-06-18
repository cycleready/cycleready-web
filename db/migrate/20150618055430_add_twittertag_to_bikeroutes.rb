class AddTwittertagToBikeroutes < ActiveRecord::Migration
  def change
    add_column :bikeroutes, :twitter_tag, :string
  end
end
