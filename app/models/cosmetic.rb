class Cosmetic < ActiveRecord::Base
	belongs_to :product
	validates_presence_of :color,:product_id
	validates_uniqueness_of :product_id
	
end
