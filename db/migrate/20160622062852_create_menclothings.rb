class CreateMenclothings < ActiveRecord::Migration
  def change
    create_table :menclothings do |t|
    	t.integer "product_id"
      t.integer 'user_id'
    	
    	t.string "color",:limit=>20
    	t.string "size",:limit=>20
    	
    	t.integer "created_by"
    	t.integer "updated_by"
      t.timestamps null: false
    end
  end
end
