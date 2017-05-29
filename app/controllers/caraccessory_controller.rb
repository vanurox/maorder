class CaraccessoryController < ApplicationController
  layout 'admin'
  include ApplicationHelper
  before_filter :confirm_login
  before_filter :dp
  before_filter :confirm_admin
  
  def caraccessory 
    @page_title = "Car Accessories Details" 
  	addFeature
  end

  def addCaraccessory
    
    @users = User.all
    @product = Product.all	
  	@caraccessory = Caraccessory.new(caraccessory_params)
  	if @caraccessory.valid?
  		@caraccessory.save
      @id = @caraccessory.product_id
      @u_id = @caraccessory.user_id
      redirect_to :controller=>'photo',:action=>'photo',:id=>@id,:u_id=>@u_id
  	else
  		@object = @caraccessory.errors.full_messages
  		render 'caraccessory'
  	end	
  end
  # def show
  #   # @women = Womenclothing.where("user_id = #{session[:user_id]}")
  # end

  def edit  
    @page_title = "Car Accessories Details" 
 	editFeature
    @id = params[:id]
    @caraccessory = Caraccessory.find_by_product_id(@id)
    if @caraccessory
      render 'edit'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end

  def updateCaraccessory  
    @caraccessory=Caraccessory.find(params[:id])
    if @caraccessory.valid?
      @caraccessory.update_attributes(caraccessory_params)
    redirect_to :controller=>'feature',:action=>"show"
    else
      @object=@caraccessory.errors.full_messages
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
    @page_title = "Car acessory Details" 
    @id = params[:id]
    @caraccessory = Caraccessory.find_by_product_id(@id)
    if @caraccessory
      render 'view'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end
  
  def caraccessory_params
  	return params.require(:caraccessory).permit(:user_id,:product_id,:brand,:name,:color,:size,:price,:popularity,:created_by,:updated_by)
  end
end
