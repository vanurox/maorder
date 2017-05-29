class CarController < ApplicationController
  layout 'admin'
  include ApplicationHelper
  before_filter :confirm_login
  before_filter :dp
  before_filter :confirm_admin
  
  def car 
    @page_title = "Cars Details" 
  	addFeature
  end

  def addCar
    @users = User.all
    @product = Product.all	
  	@car = Car.new(car_params)
  	if @car.valid?
  		@car.save
      @id = @car.product_id
      @u_id = @car.user_id
      redirect_to :controller=>'photo',:action=>'photo',:id=>@id,:u_id=>@u_id
  	else
  		@object = @car.errors.full_messages
  		render 'car'
  	end	
  end
  # def show
  #   # @women = Womenclothing.where("user_id = #{session[:user_id]}")
  # end

  def edit 
    
    @page_title = "Cars Details" 
 	editFeature
    @id = params[:id]
    @car = Car.find_by_product_id(@id)
    if @car
      render 'edit'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end

  def updateCar
    
    @car=Car.find(params[:id])
    if @car.valid?
      @car.update_attributes(car_params)
    redirect_to :controller=>'feature',:action=>"show"
    else
      @object=@car.errors.full_messages
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
      
    @page_title = "Cars Details" 
    @id = params[:id]
    @car = Car.find_by_product_id(@id)
    if @car
      render 'view'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end
  def car_params
  	return params.require(:car).permit(:user_id,:product_id,:brand,:name,:model,:mileage,:price,:popularity,:created_by,:updated_by)
  end
end
