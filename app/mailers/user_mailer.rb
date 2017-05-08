class UserMailer < ApplicationMailer
	def send_reset_link(user,token)	 
		@user = user
		@token = token
		mail to: @user.email, subject: "Password Reset Link:- Hookah Royals"
	end
 
	def password_reset_successfully(user)
		@user = user
		mail to: @user.email, subject: "Password reset successfully:- Hookah Royals"
	end
end
