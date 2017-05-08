class Ordermaster < ActiveRecord::Base
	has_many :orderdetail
	has_many :billing
	has_many :shipping
	belongs_to :user
	belongs_to :product
end
