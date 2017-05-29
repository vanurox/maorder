class WomenclothingController < ApplicationController
	layout 'admin'
include ApplicationHelper
  before_filter :confirm_login
  before_filter :dp
  before_filter :confirm_admin
  
  def womenclothing
    
    @page_title = "Women Clothing Details" 
  	addFeature
  end

  def addWomen
    @users = User.all
    @product = Product.all	
  	@women = Womenclothing.new(women_params)
  	if @women.valid?
  		@women.save
      @id = @women.product_id
      @u_id = @women.user_id
      redirect_to :controller=>'photo',:action=>'photo',:id=>@id,:u_id=>@u_id
  	else
  		@object = @women.errors.full_messages
  		render 'womenclothing'
  	end	
  end
  # def show
  #   # @women = Womenclothing.where("user_id = #{session[:user_id]}")
  # end

  def edit 
    
    @page_title = "Women Clothing Details" 
 editFeature
    @id = params[:id]
    @women = Womenclothing.find_by_product_id(@id)
    if @women
      render 'edit'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end

  def updateWomen
    
    @women=Womenclothing.find(params[:id])
    if @women.valid?
      @women.update_attributes(women_params)
    redirect_to :controller=>'feature',:action=>"show"
    else
      @object=@women.errors.full_messages
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
      
    @page_title = "Women Clothing Details" 
    @id = params[:id]
    @women = Womenclothing.find_by_product_id(@id)
    if @women
      render 'view'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end
  def women_params
  	return params.require(:women).permit(:user_id,:product_id,:brand,:color,:size,:price,:popularity,:created_by,:updated_by)
  end
end
