class Category < ActiveRecord::Base
	belongs_to :maincategory
	has_one :subcategory
	paginates_per 5
	validates_presence_of :maincategory_id
	validates_presence_of :category,:message =>" name can't be blank"
	
end
