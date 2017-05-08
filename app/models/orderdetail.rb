class Orderdetail < ActiveRecord::Base
	belongs_to :ordermaster
	belongs_to :product
end
