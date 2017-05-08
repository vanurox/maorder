class Userdetail < ActiveRecord::Base
	
	belongs_to :user
	paginates_per 5
	validates_presence_of :user_id,:name,:number,:shop_name,:shop_address
	validates :number, :numericality=>true,:length=>{:maximum=>10 , :minimum=> 10} 
end
