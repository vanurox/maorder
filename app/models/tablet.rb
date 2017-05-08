class Tablet < ActiveRecord::Base
	belongs_to :product
	validates_presence_of :product_id,:os,:user_id
	validates_uniqueness_of :product_id
	
end
