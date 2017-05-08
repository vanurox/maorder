class Subcategory < ActiveRecord::Base
	has_one :product
	belongs_to :category
	paginates_per 5
	
	validates_presence_of :category_id
	validates_presence_of :subcategory
	
end
