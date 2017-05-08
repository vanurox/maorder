class Shipping < ActiveRecord::Base
	belongs_to :ordermaster
	validates_presence_of :shipping_name,:shipping_contact,:shipping_zip,:shipping_address
	validates :shipping_contact, :numericality=>true,:length=>{:maximum=>10 , :minimum=> 10} 
	validates :shipping_zip, :numericality=>true,:length=>{:maximum=>6 , :minimum=> 6} 
end
