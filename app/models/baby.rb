class Baby < ActiveRecord::Base
	belongs_to :product
	validates :product_id,:color,:size,presence: true
end
