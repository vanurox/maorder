class CreateSmallappliances < ActiveRecord::Migration
  def change
    create_table :smallappliances do |t|
    	t.integer "product_id"
    	t.integer "user_id"
    	t.string "color"
    	t.integer "created_by"
      t.integer "updated_by"
      t.timestamps null: false
    end
  end
end
