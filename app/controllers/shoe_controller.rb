class ShoeController < ApplicationController
	layout 'admin'
 include ApplicationHelper
  before_filter :confirm_login
  before_filter :dp
 
  def shoe
    @page_title = "Shoes Details" 
  	addFeature
  end

   def add
    
    @users = User.all
    @product = Product.all
  	@insert = Shoe.new(sh_params)
  	if @insert.valid?
  		@insert.save
      @id = @insert.product_id
  		@u_id = @insert.user_id
  		redirect_to :controller=>'photo',:action=>'photo',:id=>@id,:u_id=>@u_id
  	else
  		@object = @insert.errors.full_messages
  		render 'shoes'
  	end
  end
  
  # def show
  #   @shoe = Shoe.where("user_id = #{session[:user_id]}")
  # end

  def view
    @page_title = "Shoes Details" 
    @id = params[:id]
    @shoe = Shoe.find_by_product_id(@id)
    if @shoe
      render 'view'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end

  def edit 
    @page_title = "Shoes Details" 
  editFeature
    @id = params[:id]
    @shoe = Shoe.find_by_product_id(@id)
    if @shoe
      render 'edit'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end

  def update
    @shoe = Shoe.find(params[:id])
    if @shoe.valid?
      @shoe.update_attributes(sh_params)
    redirect_to :controller=>'feature',:action=>"show"
    else
      @object=@shoe.errors.full_messages
     render 'edit'
      
    end
  end

  def sh_params
    return params.require(:shoe).permit(:user_id,:product_id,:color,:size,:created_by,:updated_by)
  end
end
