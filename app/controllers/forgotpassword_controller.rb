class ForgotpasswordController < ApplicationController

	def sendEmail
		
	end

	def changePassword
		@token = params[:id]
	end

	def sendLink
		email = params[:sendEmail][:email]
	    user = User.find_by_email(email)
	    if user
	      user.password_reset_token = SecureRandom.hex
	      user.password_reset_token_sent_at = DateTime.now
	      user.expired = 0
	      user.save
	      UserMailer.send_reset_link(user,user.password_reset_token).deliver!
	      @msg =  "Reset link has been sent"
	      render 'sendEmail'
	    else  
	     @msg =  "Email not present in our database"
	      render 'sendEmail'
	    end
	end

	def update_password
    password = params[:resetPassword][:new_password]
    confirm_password = params[:resetPassword][:confirm_password]
    token = params[:resetPassword][:token]
    if password == confirm_password
	    @user = User.find_by_password_reset_token(token)
	    if @user
	      sent_time = @user.password_reset_token_sent_at.to_time + 2.hours
	      current_time = DateTime.now.to_time
	        if current_time > sent_time
	          flash[:danger]= "Token Expired"
	          redirect_to :action=>'changePassword',:id=>token
	          return false
	        else
	          @user.password = password
	          @user.expired = 1
	          if @user.save
	            UserMailer.password_reset_successfully(@user).deliver!
	             redirect_to :controller=>'public',:action=>'view'
	          	 return false
	          else
	           
	          	flash[:danger]= "Error occur while resetting password"
	          	redirect_to :action=>'changePassword',:id=>token
	          	return false
	          end
	        end
	    else
	      
	       flash[:danger]= "Cannot Reset Password.Please Try again"
	       redirect_to :action=>'changePassword',:id=>token
	       return false
	    end
	  end
    else
    	flash[:danger]= "Password and Confirm Password doesnot match"
    	redirect_to :action=>'changePassword',:id=>token
	    return false 	
    end
    
end
