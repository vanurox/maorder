class CreateWomenbags < ActiveRecord::Migration
  def change
    create_table :womenbags do |t|
    	t.integer "product_id"
    	t.integer "user_id"
    	t.string "color"
    	t.string "material",:limit=>28
    	t.integer "created_by"
      t.integer "updated_by"
      t.timestamps null: false
    end
  end
end
