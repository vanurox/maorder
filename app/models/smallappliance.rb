class Smallappliance < ActiveRecord::Base
	belongs_to :product
	validates :product_id,:color,presence: true
end
