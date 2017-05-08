class CreateKitchenappliances < ActiveRecord::Migration
  def change
    create_table :kitchenappliances do |t|
    	t.integer "product_id"
    	t.integer "user_id"
    	
    	t.string "color",:limit=>30
    	
    	t.integer "created_by"
    	t.integer "updated_by"
      t.timestamps null: false

    end
  end
end
