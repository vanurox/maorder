class Womenbag < ActiveRecord::Base
	belongs_to :product
	validates :product_id,:color,:material,presence: true
end
