class CreateShippings < ActiveRecord::Migration
  def change
    create_table :shippings do |t|
    	t.integer "ordermaster_id"
    	t.string "shipping_name" , :limit=>30
    	t.string "shipping_contact",:limit => 40
    	t.string "shipping_zip",:limit => 40
    	t.text "shipping_address"
      t.timestamps null: false
    end
  end
end
