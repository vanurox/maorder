class Homefurnishing < ActiveRecord::Base
	belongs_to :product
	validates_presence_of :product_id,:user_id,:color
	validates_uniqueness_of :product_id
	
end
