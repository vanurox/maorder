class User < ActiveRecord::Base
	require 'digest/sha1'
	 before_save :do_hashing
	has_one :userdetail
	has_many :ordermaster
	has_many :product
	paginates_per 5

	validates_presence_of :email
	validates_uniqueness_of :email
	VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
	  validates_length_of :password, minimum: 6 

	 	def hash_password(password)
	 		return Digest::SHA1.hexdigest(password)
	 	end

	 	def do_hashing
	 		self.password = hash_password(self.password)
	 	end

	 def self.authenticate_user(email,password)
    	@user = User.find_by_email(email)
		if @user && @user.password ==  self.new.hash_password(password)
			return @user
		else
			return false
	  	end 
    end



    def self.sign_in_from_omniauth(auth)
    	user = find_or_create_by(uid: auth['uid'], provider: auth['provider'])
	    user.name = auth['info']['name']
	    user.email = auth.info.email
	    user.uid = auth['uid']
	    user.provider = auth['provider']
	    user.password = "workingfine"
	    user.save!
	    user
		# find_by(provider: auth['provider'],uid: auth['uid']) || create_user_from_omniauth(auth)
	end

	# def self.create_user_from_omniauth(auth)
	# 	create(
	# 			email: auth['info']['email'],
	# 			provider: auth['provider'],
	# 			uid: auth['uid'],
	# 			name: auth['info']['name']
	# 		)
	# end
end
