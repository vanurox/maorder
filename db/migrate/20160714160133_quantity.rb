class Quantity < ActiveRecord::Migration
  def change
  	add_column :orderdetails,"quantity",:string,:limit=>20
  end
end
