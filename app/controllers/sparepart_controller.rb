class SparepartController < ApplicationController
	layout 'admin'
  include ApplicationHelper
  before_filter :confirm_login
  before_filter :dp
  before_filter :confirm_admin
  
  def sparepart 
    @page_title = "Spare Parts Details" 
  	addFeature
  end

  def addSparepart
    @users = User.all
    @product = Product.all	
  	@sparepart = Sparepart.new(sparepart_params)
  	if @sparepart.valid?
  	  @sparepart.save
      @id = @sparepart.product_id
      @u_id = @sparepart.user_id
      redirect_to :controller=>'photo',:action=>'photo',:id=>@id,:u_id=>@u_id
  	else
  		@object = @sparepart.errors.full_messages
  		render 'sparepart'
  	end	
  end
  # def show
  #   # @women = Womenclothing.where("user_id = #{session[:user_id]}")
  # end

  def edit  
    @page_title = "Spare Parts Details" 
 	editFeature
    @id = params[:id]
    @sparepart = Sparepart.find_by_product_id(@id)
    if @sparepart
      render 'edit'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end

  def updateSparepart
    @sparepart=Sparepart.find(params[:id])
    if @sparepart.valid?
      @sparepart.update_attributes(sparepart_params)
      redirect_to :controller=>'feature',:action=>"show"
    else
      @object=@sparepart.errors.full_messages
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
      
    @page_title = "Sparepart Details" 
    @id = params[:id]
    @sparepart = Sparepart.find_by_product_id(@id)
    if @sparepart
      render 'view'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end
  def sparepart_params
  	return params.require(:sparepart).permit(:user_id,:product_id,:brand,:name,:model,:mileage,:price,:popularity,:created_by,:updated_by)
  end

end
