class CosmeticController < ApplicationController

  layout 'admin'
 include ApplicationHelper
  before_filter :confirm_login
  before_filter :dp
  before_filter :confirm_admin
  
  def cosmetic
    
    @page_title = "Cosmetic Details"
  	addFeature
  end

  def add
  	cosmetic
    @users = User.all
    @product = Product.all
  	@insert = Cosmetic.new(cs_params)
  	if @insert.valid?
  		@insert.save
      @id = @insert.product_id
  		@u_id = @insert.user_id
  		redirect_to :controller=>'photo',:action=>'photo',:id=>@id,:u_id=>@u_id
  	else
  		@object = @insert.errors.full_messages
  		render 'cosmetics'
  	end
  end
  
  # def show
  #   @cosmetics = Cosmetic.where("user_id = #{session[:user_id]}")
  # end

  def view
    @page_title = "Cosmetic Details"
    @id = params[:id]
    @cosmetic = Cosmetic.find_by_product_id(@id)
    if @cosmetic 
      render 'view'
    else
      redirect_to :controller=>'admin',:action=>"error_msg" 
    end
  end


  def edit 
    
    @page_title = "Cosmetic Details"
 editFeature
    @id = params[:id]
    @cosmetic = Cosmetic.find_by_product_id(@id)
    if @cosmetic
      render 'edit'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end

  def update
    @cosmetic = Cosmetic.find(params[:id])
    if @cosmetic.valid?
      @cosmetic.update_attributes(cs_params)
    redirect_to :controller=>'feature',:action=>"show"
    else
      @object=@cosmetic.errors.full_messages
     render 'edit'
      
    end
  end

  def cs_params
    return params.require(:cosmetic).permit(:user_id,:product_id,:color,:created_by,:updated_by)
  end
end
