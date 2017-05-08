class Maincategory < ActiveRecord::Base
	has_one :category
	paginates_per 5
	validates_presence_of :main_category
	validates_uniqueness_of :main_category
end
