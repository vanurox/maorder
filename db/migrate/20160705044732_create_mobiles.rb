class CreateMobiles < ActiveRecord::Migration
  def change
    create_table :mobiles do |t|
    	t.integer 'product_id'
      t.integer 'user_id'
    	t.string 'os',:limit=>20
        t.integer "created_by"
        t.integer "updated_by"
      t.timestamps null: false
    end
  end
end
