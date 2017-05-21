class BabyController < ApplicationController
	layout 'admin'
include ApplicationHelper
  before_filter :confirm_login
  before_filter :dp
  
  def baby 
    @page_title = "Baby products Details" 
  	addFeature
  end

  def addBaby
    @users = User.all
    @product = Product.all	
  	@baby = Baby.new(baby_params)
  	if @baby.valid?
  		@baby.save
      @id = @baby.product_id
      @u_id = @baby.user_id
      redirect_to :controller=>'photo',:action=>'photo',:id=>@id,:u_id=>@u_id
  	else
  		@object = @baby.errors.full_messages
  		render 'baby'
  	end	
  end
  # def show
  #   # @women = Womenclothing.where("user_id = #{session[:user_id]}")
  # end

  def edit 
    
    @page_title = "Baby products Details" 
 	editFeature
    @id = params[:id]
    @baby = Baby.find_by_product_id(@id)
    if @baby
      render 'edit'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end

  def updateBaby
    
    @baby=Baby.find(params[:id])
    if @baby.valid?
      @baby.update_attributes(baby_params)
    redirect_to :controller=>'feature',:action=>"show"
    else
      @object=@baby.errors.full_messages
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
      
    @page_title = "Baby products Details" 
    @id = params[:id]
    @baby = Baby.find_by_product_id(@id)
    if @baby
      render 'view'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end
  def baby_params
  	return params.require(:baby).permit(:user_id,:product_id,:brand,:color,:size,:price,:popularity,:created_by,:updated_by)
  end
end
