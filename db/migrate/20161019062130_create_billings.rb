class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
    	t.integer "ordermaster_id"
    	t.string "name" , :limit=>30
    	t.string "email",:limit => 80
    	t.string "contact",:limit => 40
    	t.string "country",:limit => 50
    	t.string "zip",:limit => 40
    	t.text "address"
      t.timestamps null: false
    end
  end
end
