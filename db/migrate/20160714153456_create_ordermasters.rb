class CreateOrdermasters < ActiveRecord::Migration
  def change
    create_table :ordermasters do |t|
    	t.integer "user_id"
    	t.string "total_products",:limit=>10
    	t.decimal "total_cost",:precision=>10,:scale=>2
      t.timestamps null: false
    end
  end
end
