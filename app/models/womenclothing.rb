class Womenclothing < ActiveRecord::Base
	belongs_to :product
	validates_presence_of :product_id,:color,:size
	validates_uniqueness_of :product_id
	
end
