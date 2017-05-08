class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string "email",:limit=>80
    	t.string "password",:limit=>50
    	t.boolean "is_active",:default=>true
    	t.boolean "is_admin",:default=>false
    	t.boolean "is_seller",:default=>false
      t.string :provider
      t.string :uid
      t.string :name
    	t.integer "created_by"
    	t.integer "updated_by"
      t.timestamps null: false
    end
  end
end
