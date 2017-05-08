class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.integer "user_id"
    	t.integer "subcategory_id"
      t.string "product_name",:limit=>25
      t.string "product_code",:limit=>30
    	t.string "typee",:limit=>25
      t.decimal 'price',:precision=>10,:scale=>2
      t.string 'brand',:limit=>20
      t.string "popularity",:limit=>20
    	t.integer "created_by"
    	t.integer "updated_by"
      t.timestamps null: false
    end
  end
end
