class SessionsController < ApplicationController
	rescue_from ActionController::InvalidAuthenticityToken, with: :destroy
	def create
		auth = request.env["omniauth.auth"]
		session[:omniauth] = auth.except('extra')
		user = User.sign_in_from_omniauth(auth)
		session[:user_id] = user.id
		session[:email] = user.email
		
		redirect_to root_url
	end

	def destroy
		session[:email] = nil
	    session[:id] = nil
	    session[:is_admin] = nil
	    session[:is_seller] = nil
	    session[:user_id] = nil
	    session[:omniauth] = nil
	    session[:name] = nil
	    session[:products] = nil
	    session[:cart_size] = nil
	     sleep 3
		redirect_to root_url, notice: "SIGNED OUT"
	end
end
