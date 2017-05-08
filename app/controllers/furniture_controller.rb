class FurnitureController < ApplicationController
	layout 'admin'
include ApplicationHelper
  before_filter :confirm_login
  before_filter :dp

  def furniture
    @page_title = "Furniture Details"
    addFeature
  end

  def add
  furniture
  @users = User.all
    @product = Product.all  
    @furniture = Furniture.new(furniture_params)
    if @furniture.valid?
      @furniture.save
      @id = @furniture.product_id
      @u_id = @furniture.user_id
      @msg = "Saved Succesfully"
      redirect_to :controller=>'photo',:action=>'photo' ,:id=>@id,:u_id=>@u_id
    else
      @object = @furniture.errors.full_messages
      render 'furniture'
    end 
  end

  # def show
  #   @furniture = Furniture.where("user_id = #{session[:user_id]}")
  # end


  def edit 

    @page_title = "Furniture Details"
    editFeature
    @id = params[:id]
    @furniture = Furniture.find_by_product_id(@id)
    if @furniture
      render 'edit'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end

  def update
    @furniture=Furniture.find(params[:id])
    if @furniture.valid?
      @furniture.update_attributes(furniture_params)
      redirect_to :controller=>'feature',:action=> 'show'
    else
      @object=@furniture.errors.full_messages
     render 'edit'
      
    end
  end

  # def delete
  #   @id = params[:id]
  #   @furniture = Furniture.find_by_id(@id)
  #   if @furniture.destroy
  #     redirect_to :action=>'show'
  #   else
  #     render 'error'
  #   end
  # end

  def view
    @page_title = "Furniture Details"
    @id = params[:id]
    @furniture = Furniture.find_by_product_id(@id)
    if @furniture 
      render 'view'
    else
      redirect_to :controller=>'admin',:action=>"error_msg" 
    end
  end
 
  def furniture_params
  	return params.require(:furniture).permit(:user_id,:product_id,:color,:created_by,:updated_by)
  end 
end
