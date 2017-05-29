class KitchenapplianceController < ApplicationController
  layout 'admin'
 include ApplicationHelper
  before_filter :confirm_login
  before_filter :dp
  before_filter :confirm_admin

  def kitchenappliance
    

    @page_title = "kitchen Appliance Details" 
  addFeature
  end

  def addKitchenappliance
    @users = User.all
    @product = Product.all
    
    kitchenappliance 
    @kitchenappliance = Kitchenappliance.new(kitchen_params)
    if @kitchenappliance.valid?
      @kitchenappliance.save
      @id = @kitchenappliance.product_id
      @u_id = @kitchenappliance.user_id
      redirect_to :controller=>'photo',:action=>'photo' ,:id=>@id,:u_id=>@u_id
    else
      @object = @kitchenappliance.errors.full_messages
      render 'kitchenappliance'
    end 
  end

  # def show
  #   @kitchenappliance = Kitchenappliance.where("user_id = #{session[:user_id]}")
  # end

  def edit 
    
    editFeature
    @product = Product.where("user_id = #{session[:user_id]}")
    @id = params[:id]
    @kitchenappliance = Kitchenappliance.find_by_product_id(@id)
    if @kitchenappliance
      render 'edit'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end

  def updateKitchenappliance
    

    @kitchenappliance = Kitchenappliance.find(params[:id])
    if @kitchenappliance.valid?
      @kitchenappliance.update_attributes(kitchen_params)
      redirect_to :controller=>'feature',:action=> 'show'
    else
      @object=@kitchenappliance.errors.full_messages
     render 'edit'    
    end
  end

  # def delete
  #   @id = params[:id]
  #   @kitchenappliance = Kitchenappliance.find_by_id(@id)
  #   if @kitchenappliance.destroy
  #     redirect_to :action=>'show'
  #   else
  #     render 'error'
  #   end
  # end

  def view
    
    
    @page_title = "kitchen Appliance Details" 
    @id = params[:id]
    @kitchenappliance = Kitchenappliance.find_by_product_id(@id)
    if @kitchenappliance 
      render 'view'
    else
      redirect_to :controller=>'feature',:action=>'show' 
    end
  end
 
  def kitchen_params
  	return params.require(:kitchenappliance).permit(:user_id,:product_id,:color,:created_by,:updated_by)
  end  
end
