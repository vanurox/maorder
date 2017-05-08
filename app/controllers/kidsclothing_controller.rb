class KidsclothingController < ApplicationController
  
  layout 'admin'
  include ApplicationHelper
  before_filter :confirm_login
  before_filter :dp

  def kidsclothing
    @page_title = "kids Clothing Details"
  	addFeature
  end

  def addKid
    @users = User.all
    @product = Product.all
	
  	@kid = Kidsclothing.new(kid_params)
  	if @kid.valid?
  		@kid.save
      @id = @kid.product_id
      @u_id = @kid.user_id
      redirect_to :controller=>'photo',:action=>'photo',:id=>@id,:u_id=>@u_id
  	else
  		@object = @kid.errors.full_messages
  		render 'kidsclothing'
  	end	
  end

  # def show
  #   @kid = Kidsclothing.where("user_id = #{session[:user_id]}")
  # end


  def edit 
    @page_title = "kids Clothing Details"
    editFeature
    @id = params[:id]
    @kid = Kidsclothing.find_by_product_id(@id)
    if @kid
      render 'edit'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end

  def updateKid
    
    
    @kid=Kidsclothing.find(params[:id])
    if @kid.valid?
      @kid.update_attributes(kid_params)
      redirect_to :controller=>'feature',:action=> 'show'
    else
      @object = @kid.errors.full_messages
      render 'edit' 
    end
  end
  # def delete
  #   @id = params[:id]
  #   @kid = Kidsclothing.find_by_id(@id)
  #   if @kid.destroy
  #     redirect_to :action=>'show'
  #   else
  #     render 'error'
  #   end
  # end
   def view
    
    
    @page_title = "kids Clothing Details"
    @id = params[:id]
    @kid = Kidsclothing.find_by_product_id(@id)
    if @kid 
      render 'view'
    else
      redirect_to :controller=>'admin',:action=>"error_msg"
    end
  end

  def kid_params
  	return params.require(:kids).permit(:user_id,:product_id,:color,:size,:created_by,:updated_by)
  end
end
