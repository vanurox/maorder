class SmallapplianceController < ApplicationController
	layout 'admin'
include ApplicationHelper
  before_filter :confirm_login
  before_filter :dp
  before_filter :confirm_admin
  
  def smallappliance 
    @page_title = "Smallappliances Details" 
  	addFeature
  end

  def addAppliance
    @users = User.all
    @product = Product.all	
  	@appliance = Smallappliance.new(appliance_params)
  	if @appliance.valid?
  		@appliance.save
      @id = @appliance.product_id
      @u_id = @appliance.user_id
      redirect_to :controller=>'photo',:action=>'photo',:id=>@id,:u_id=>@u_id
  	else
  		@object = @appliance.errors.full_messages
  		render 'smallappliance'
  	end	
  end
  # def show
  #   # @women = Womenclothing.where("user_id = #{session[:user_id]}")
  # end

  def edit 
    
    @page_title = "Smallappliances Details" 
 	editFeature
    @id = params[:id]
    @appliance = Smallappliance.find_by_product_id(@id)
    if @appliance
      render 'edit'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end

  def updateAppliance
    
    @appliance=Smallappliance.find(params[:id])
    if @appliance.valid?
      @appliance.update_attributes(appliance_params)
    redirect_to :controller=>'feature',:action=>"show"
    else
      @object=@appliance.errors.full_messages
     render 'edit'
      
    end
  end
  # def delete
  #   @id = params[:id]
  #   @women = Womenclothing.find_by_id(@id)
  #   if @women.destroy
  #     redirect_to :action=>'show'
  #   else
  #     render 'error'
  #   end
  # end
    def view
      
    @page_title = "Smallappliance Details" 
    @id = params[:id]
    @appliance = Smallappliance.find_by_product_id(@id)
    if @appliance
      render 'view'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end
  def appliance_params
  	return params.require(:smallappliance).permit(:user_id,:product_id,:brand,:color,:price,:popularity,:created_by,:updated_by)
  end
end
