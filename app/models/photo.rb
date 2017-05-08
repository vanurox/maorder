class Photo < ActiveRecord::Base
	belongs_to :product
	paginates_per 5
	
	validates_uniqueness_of :product_id
	validates_presence_of :product_id
end
