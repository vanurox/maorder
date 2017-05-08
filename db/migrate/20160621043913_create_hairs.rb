class CreateHairs < ActiveRecord::Migration
  def change
    create_table :hairs do |t|
    	t.integer "product_id"
      t.integer 'user_id'
    	t.string "length" , :limit=>25
    	t.string "color" , :limit=>25
    	
    	t.integer "created_by"
    	t.integer "updated_by"
      t.timestamps null: false
    end
  end
end
