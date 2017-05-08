class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    t.integer 'product_id'
    t.integer 'user_id'
    t.string "photo1" ,:limit=>50
    t.string "photo1" ,:limit=>50
    t.string "photo2" ,:limit=>50
    t.string "photo3" ,:limit=>50
    t.string "photo4" ,:limit=>50
    t.string "photo5" ,:limit=>50
    t.string "photo6" ,:limit=>50
    t.integer "created_by"
    t.integer "updated_by"	
    t.timestamps null: false

    end
  end
end
