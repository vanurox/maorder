class CameraController < ApplicationController
	layout 'admin'
  include ApplicationHelper
  before_filter :confirm_login
  before_filter :dp
  before_filter :confirm_admin

  def camera
    @page_title = "Camera Details"
    addFeature
  end

  def add 
  @users = User.all
    
    @product = Product.all  
    @camera = Camera.new(camera_params) 
    if @camera.valid?
      @camera.save
      @id = @camera.product_id
      @u_id = @camera.user_id
      redirect_to :controller=>'photo',:action=>'photo',:id=>@id,:u_id=>@u_id
    else
      @object = @camera.errors.full_messages
      render 'camera'
    end 
  end

  # def show
  #   @camera = Camera.where("user_id = #{session[:user_id]}")
  # end


  def edit
    @page_title = "Camera Details"
    editFeature
    @id = params[:id]
    @camera = Camera.find_by_product_id(@id)
    if @camera
      render 'edit'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end

  def update 
    @camera=Camera.find(params[:id])
    if @camera.valid?
      @camera.update_attributes(camera_params)
      redirect_to :controller=>'feature',:action=> 'show'
    else
      @object=@camera.errors.full_messages
      render 'edit'  
    end
  end

  # def delete
  #   @id = params[:id]
  #   @camera = Camera.find_by_id(@id)
  #   if @camera.destroy
  #     redirect_to :action=>'show'
  #   else
  #     render 'error'
  #   end
  # end

  def view
    
    @page_title = "Camera Details"
    @id = params[:id]
    @camera = Camera.find_by_product_id(@id)
    if @camera 
      render 'view'
    else
      redirect_to :controller=>'admin',:action=>"error_msg" 
    end
  end
 
  def camera_params
  	return params.require(:camera).permit(:user_id,:product_id,:pixel,:created_by,:updated_by)
  end
end
