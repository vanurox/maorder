class AdminController < ApplicationController
	layout 'admin'
  before_filter :confirm_login
  before_filter :confirm_admin
	include ApplicationHelper
  def admin
  	dp
    if session[:is_admin]
       session[:count_shipping] = Shipping.count('id')
        session[:count_billing] = Billing.count('id')
        session[:count_product] = Product.count('id')
        session[:count_seller] = User.where('is_seller = true').count('email', :distinct => true)
        session[:count_user] = User.count('email', :distinct => true)
        session[:count_order] = Ordermaster.count('id')
    elsif session[:is_seller]
       
        session[:count_product] = Product.where(:user_id =>session[:user_id]).size
        session[:count_order] = Ordermaster.where(:user_id =>session[:user_id]).size
      
    end
   
  end
  def error_msg
  	
  end
  def dp
    if session[:email] 
      @uid= session[:user_id]
      @details =Userdetail.find_by_user_id(@uid)
    else
      redirect_to :controller=>'login',:action=>'login'
      end
  end
  def vieworder
    @order = Ordermaster.page(params[:page]).per(5)
  end

  def billDetails
    @billing = Billing.find_by_ordermaster_id(params[:id])
  end
  
  def shipDetails
    @shipping = Shipping.find_by_ordermaster_id(params[:id])
  end
end
