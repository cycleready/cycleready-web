class CreateBikeroutes < ActiveRecord::Migration
  def change
    create_table :bikeroutes do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
