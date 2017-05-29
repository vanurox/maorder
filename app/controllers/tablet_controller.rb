class TabletController < ApplicationController
layout 'admin'
include ApplicationHelper
  before_filter :confirm_login
  before_filter :dp
  before_filter :confirm_admin

  def tablet
  
    @page_title = "Tablet Details" 
  	addFeature
  end
  def addTablet
 @users = User.all
    @product = Product.all 	
  	@tablets = Tablet.new(tablet_params)
  	if @tablets.valid?
  		@tablets.save
      @id = @tablets.product_id
      @u_id = @tablets.user_id
      redirect_to :controller=>'photo',:action=>'photo',:id=>@id,:u_id=>@u_id
  	else
  		@object = @tablets.errors.full_messages
  		render 'tablet'
  	end	
  end
  # def show
  #   # @tablets = Tablet.where("user_id = #{session[:user_id]}")
  #   # @product = Product.where("user_id = #{session[:user_id]}")
  # end


  def edit 
  
    @page_title = "Tablet Details" 
    editFeature
    @id = params[:id]
    @tablets = Tablet.find_by_product_id(@id)
    if @tablets
      render 'edit'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end

  def updateTablet
  
    @tablets = Tablet.find(params[:id])
    if @tablets.valid?
      @tablets.update_attributes(tablet_params)
    redirect_to :controller=>'feature',:action=>"show"
     
    else
      @object=@tablets.errors.full_messages
     render 'edit'
      
    end
  end
  # def delete
  #   @id = params[:id]
  #   @tablets = Tablet.find_by_id(@id)
  #   if @tablets.destroy
  #     redirect_to :action=>'show'
  #   else
  #     render 'error'
  #   end
  # end
    def view
  
    @page_title = "Tablet Details" 
    @id = params[:id]
    @tablets = Tablet.find_by_product_id(@id)
    if @tablets
      render 'view'
    else
    redirect_to :controller=>'feature',:action=>'show' 
    end
  end
  def tablet_params
  	return params.require(:tablet).permit(:user_id,:product_id,:os,:created_by,:updated_by)
  end  
end
