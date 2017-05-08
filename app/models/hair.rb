class Hair < ActiveRecord::Base
	belongs_to :product
	validates_presence_of :length,:color,:product_id
	validates_uniqueness_of :product_id
	
end
