class CreateCaraccessories < ActiveRecord::Migration
  def change
    create_table :caraccessories do |t|
    	t.integer "product_id"
    	t.integer "user_id"
    	t.string "name"
    	t.string "color"
    	t.string "size",:limit=>28
    	t.integer "created_by"
      t.integer "updated_by"
      t.timestamps null: false
    end
  end
end
