class MenclothingController < ApplicationController
	layout 'admin'
  include ApplicationHelper

  before_filter :confirm_login
  before_filter :dp

  def menclothing
    addFeature
    @page_title = "Men Clothing Details" 
  end

  def addMen
  @users = User.all
    @product = Product.all  
    @menn = Menclothing.new(men_params) 
    if @menn.valid?
      @menn.save
      @id = @menn.product_id
      @u_id = @menn.user_id
      redirect_to :controller=>'photo',:action=>'photo',:id=>@id,:u_id=>@u_id
    else
      @object = @menn.errors.full_messages
      render 'menclothing'
    end 
  end
  # def show
  #   # @men = Menclothing.where("user_id = #{session[:user_id]}")
  # end


  def edit 
    editFeature
    @page_title = "Men Clothing Details" 
    @id = params[:id]
    @men = Menclothing.find_by_product_id(@id)
    if @men
      render 'edit'
    else
    redirect_to :controller=>'admin',:action=>'error_msg' 
    end
  end

  def updateMen
    @men=Menclothing.find(params[:id])
    if @men.valid?
      @men.update_attributes(men_params)
    redirect_to :controller=>'feature',:action=>"show"
      
    else
      @object=@Menclothing.errors.full_messages
     render 'edit'
      
    end
  end
  # def delete
  #   @id = params[:id]
  #   @men = Menclothing.find_by_id(@id)
  #   if @men.destroy
  #     redirect_to :action=>'show'
  #   else
  #     render 'error'
  #   end
  # end

    def view
    @page_title = "Men Clothing Details" 
    @id = params[:id]
    @men = Menclothing.find_by_product_id(@id)
    if @men
      render 'view'
    else
    redirect_to :controller=>'feature',:action=>'show' 
    end
  end
  def men_params
  	return params.require(:men).permit(:user_id,:product_id,:color,:size,:created_by,:updated_by)
  end

end
