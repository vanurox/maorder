class CreateSpareparts < ActiveRecord::Migration
  def change
    create_table :spareparts do |t|
     t.integer "product_id"
    	t.integer "user_id"
    	t.string "name"
    	t.string "model"
    	t.string "mileage",:limit=>28
    	t.integer "created_by"
      t.integer "updated_by"
      t.timestamps null: false
    end
  end
end
