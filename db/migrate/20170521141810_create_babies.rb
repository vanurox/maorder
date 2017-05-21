class CreateBabies < ActiveRecord::Migration
  def change
    create_table :babies do |t|
    	t.integer "product_id"
    	t.integer "user_id"
    	t.string "color"
    	t.string "size",:limit=>28
    	t.integer "created_by"
      t.integer "updated_by"
      t.timestamps null: false
    end
  end
end
