class HomefurnishingController < ApplicationController
	layout 'admin'
  include ApplicationHelper
  before_filter :confirm_login
  before_filter :dp
  before_filter :confirm_admin

  def homefurnishing
    @page_title = "Home Furnishing Details"
    addFeature
  end

  def add
    homefurnishing
    @users = User.all
    @product = Product.all
    @homefurnishing = Homefurnishing.new(home_params)
    if @homefurnishing.valid?
      @homefurnishing.save
      @id = @homefurnishing.product_id
      @u_id = @homefurnishing.user_id
      redirect_to :controller=>'photo',:action=>'photo' ,:id=>@id,:u_id=>@u_id
    else
      @object = @homefurnishing.errors.full_messages
      render 'homefurnishing'
    end 
  end

  # def show
  #   @homefurnishing = Homefurnishing.where("user_id = #{session[:user_id]}")
  # end


  def edit 
  @page_title = "Home Furnishing Details"
 editFeature
    @id = params[:id]
    @homefurnishing = Homefurnishing.find_by_product_id(@id)
    if @homefurnishing
      render 'edit'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end

  def update
    @homefurnishing=Homefurnishing.find(params[:id])
    if @homefurnishing.valid?
      @homefurnishing.update_attributes(home_params)
      redirect_to :controller=>'feature',:action=> 'show'
    else
      @object=@homefurnishing.errors.full_messages
     render 'edit'
      
    end
  end

  # def delete
  #   @id = params[:id]
  #   @homefurnishing = Homefurnishing.find_by_id(@id)
  #   if @homefurnishing.destroy
  #     redirect_to :action=>'show'
  #   else
  #     render 'error'
  #   end
  # end

  def view
    @page_title = "Home Furnishing Details"
    @id = params[:id]
    @homefurnishing = Homefurnishing.find_by_product_id(@id)
    if @homefurnishing 
      render 'view'
    else
      redirect_to :controller=>'admin',:action=>"error_msg" 
    end
  end
 
  def home_params
  	return params.require(:homefurnishing).permit(:user_id,:product_id,:color,:created_by,:updated_by)
  end  
end
