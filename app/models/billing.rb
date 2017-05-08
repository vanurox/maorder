class Billing < ActiveRecord::Base
	belongs_to :ordermaster
	validates_presence_of :name,:email,:contact,:country,:zip,:address
	VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
	validates :contact, :numericality=>true,:length=>{:maximum=>10 , :minimum=> 10} 
	validates :zip, :numericality=>true,:length=>{:maximum=>6 , :minimum=> 6} 

end
