class TruckController < ApplicationController
  layout 'admin'
  include ApplicationHelper
  before_filter :confirm_login
  before_filter :dp
  before_filter :confirm_admin
  
  def truck 
    @page_title = "Truck Details" 
  	addFeature
  end

  def addTruck
    @users = User.all
    @product = Product.all	
  	@truck = Truck.new(truck_params)
  	if @truck.valid?
  	  @truck.save
      @id = @truck.product_id
      @u_id = @truck.user_id
      redirect_to :controller=>'photo',:action=>'photo',:id=>@id,:u_id=>@u_id
  	else
  		@object = @truck.errors.full_messages
  		render 'truck'
  	end	
  end
  # def show
  #   # @women = Womenclothing.where("user_id = #{session[:user_id]}")
  # end

  def edit  
    @page_title = "Truck Details" 
 	editFeature
    @id = params[:id]
    @truck = Truck.find_by_product_id(@id)
    if @truck
      render 'edit'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end

  def updateTruck
    @truck=Truck.find(params[:id])
    if @truck.valid?
      @truck.update_attributes(truck_params)
    redirect_to :controller=>'feature',:action=>"show"
    else
      @object=@truck.errors.full_messages
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
      
    @page_title = "Truck Details" 
    @id = params[:id]
    @truck = Truck.find_by_product_id(@id)
    if @truck
      render 'view'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end
  def truck_params
  	return params.require(:truck).permit(:user_id,:product_id,:brand,:name,:model,:mileage,:price,:popularity,:created_by,:updated_by)
  end
end
