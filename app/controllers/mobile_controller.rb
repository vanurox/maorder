class MobileController < ApplicationController
layout 'admin'
 include ApplicationHelper
  before_filter :confirm_login
  before_filter :dp
  before_filter :confirm_admin
  
  def mobile
    @page_title = "Mobile Details" 
  	addFeature
  end

  def addMobile 
	@users = User.all
    @product = Product.all	
  	@mobiles = Mobile.new(mobile_params)
  	if @mobiles.valid?
  		@mobiles.save
      @id = @mobiles.product_id
      @u_id = @mobiles.user_id
  		redirect_to :controller=>'photo',:action=>'photo',:id=>@id,:u_id=>@u_id
  	else
  		@object = @mobiles.errors.full_messages
  		render 'mobile'
  	end	
  end
  # def show
  #   # @mobile = Mobile.where("user_id = #{session[:user_id]}")
  # end

  def edit 
    @page_title = "Mobile Details" 
    editFeature
    @id = params[:id]
    @mobile = Mobile.find_by_product_id(@id)
    if @mobile
      render 'edit'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end

  def updateMobile
    @mobile=Mobile.find(params[:id])
    if @mobile.valid?
      @mobile.update_attributes(mobile_params)
    redirect_to :controller=>'feature',:action=>"show"
      
    else
      @object=@mobile.errors.full_messages
     render 'edit'
      
    end
  end
  # def delete
  #   @id = params[:id]
  #   @mobile = Mobile.find_by_id(@id)
  #   if @mobile.destroy
  #     redirect_to :action=>'show'
  #   else
  #     render 'error'
  #   end
  # end
    def view
      
    @page_title = "Mobile Details" 
    @id = params[:id]
    @mobile = Mobile.find_by_product_id(@id)
    if @mobile
      render 'view'
    else
    redirect_to :action=>'show' 
    end
  end
  def mobile_params
  	return params.require(:mobile).permit(:user_id,:product_id,:os,:created_by,:updated_by)
  end
end
