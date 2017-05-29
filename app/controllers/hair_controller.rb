class HairController < ApplicationController
	layout 'admin'
  include ApplicationHelper
  before_filter :confirm_login
  before_filter :dp
  before_filter :confirm_admin

  def hair
    @page_title = "Product Details"
  	addFeature
  end
  def addHair
    hair
    @users = User.all
    @product = Product.all
  	@insert = Hair.new(hair_params)
  	if @insert.valid?
  		@insert.save
      @id = @insert.product_id
  		@u_id = @insert.user_id
  		redirect_to :controller=>'photo',:action=>'photo',:id=>@id,:u_id=>@u_id
  	else
  		@object = @insert.errors.full_messages
  		render 'hair'
  	end
  end
  
  # def show
  # 	@hair = Hair.where("user_id = #{session[:user_id]}")
  # end


  def edit 
    
    @page_title = "Product Details"
   editFeature
    @id = params[:id]
    @hair = Hair.find_by_product_id(@id)
    if @hair
      render 'edit'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end

  def updateHair
    @hair = Hair.find(params[:id])
    if @hair.valid?
      @hair.update_attributes(hair_params)
    redirect_to :controller=>'feature',:action=>"show"
    else
      @object=@hair.errors.full_messages
     render 'edit'
      
    end
  end
  # def delete
  #   @id = params[:id]
  #   @hair = Hair.find_by_id(@id)
  #   if @hair.destroy
  #     redirect_to :action=>'show'
  #   else
  #     render 'error'
  #   end
  # end
    def view 
    @page_title = "Product Details"
    @id = params[:id]
    @hair = Hair.find_by_product_id(@id)
    if @hair
      render 'view'
    else
    redirect_to :controller=>'admin',:action=>"error_msg"
    end
  end
  def hair_params
  	return params.require(:hair).permit(:user_id,:product_id,:length,:color,:created_by,:updated_by)
  end
end
