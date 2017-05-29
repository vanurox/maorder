class LaptopController < ApplicationController
layout 'admin'
  include ApplicationHelper
  before_filter :confirm_login
  before_filter :dp
  before_filter :confirm_admin

  def laptop
    @page_title = "Laptop Details" 
    addFeature
  end

  def addLaptop 
 @users = User.all
    @product = Product.all 
    @laptops = Laptop.new(laptop_params)
    if @laptops.valid?
      @laptops.save
      @id = @laptops.product_id
      @u_id = @laptops.user_id
      @msg = "Saved Succesfully"
      redirect_to :action=>'photo',:controller=>'photo',:id=>@id,:u_id=>@u_id
    else
      @object = @laptops.errors.full_messages
      render 'laptop'
    end 
  end
  # def show
  #   # @laptop = Laptop.where("user_id = #{session[:user_id]}")
  # end

  def edit 
    

    @page_title = "Laptop Details" 
  editFeature
    @id = params[:id]
    @laptop = Laptop.find_by_product_id(@id)
    if @laptop
      render 'edit'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end

  def updateLaptop
    

    @laptop=Laptop.find(params[:id])
    if @laptop.valid?
      @laptop.update_attributes(laptop_params)
      redirect_to :controller=>'feature',:action=> 'show'
    else
      @object=@laptop.errors.full_messages
     render 'edit'
      
    end
  end
  # def delete
  #   @id = params[:id]
  #   @laptop = Laptop.find_by_id(@id)
  #   if @laptop.destroy
  #     redirect_to :action=>'show'
  #   else
  #     render 'error'
  #   end
  # end

    def view
    
      
    @page_title = "Laptop Details" 
    @id = params[:id]
    @laptop = Laptop.find_by_product_id(@id)
    if @laptop
      render 'view'
    else
    redirect_to :action=>'show' 
    end
  end
 
  def laptop_params
  	return params.require(:laptop).permit(:user_id,:product_id,:os,:created_by,:updated_by)
  end  
end
