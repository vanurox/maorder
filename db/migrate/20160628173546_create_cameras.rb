class CreateCameras < ActiveRecord::Migration
  def change
    create_table :cameras do |t|
    	t.integer "user_id"
    	t.integer "product_id"
    	t.string "pixel",:limit=>20
    	
    	t.integer "created_by"
    	t.integer "updated_by"
      t.timestamps null: false
    end
  end
end
