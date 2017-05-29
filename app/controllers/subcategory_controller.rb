class SubcategoryController < ApplicationController
layout 'admin'
before_filter :confirm_login
  before_filter :confirm_admin

  def subcategory
    dp

    @page_title = "Sub Category Details" 
    if params[:id]
       @id = params[:id]
        @category = Category.where("id = #{@id}")
    else
        @category = Category.all
    end
  end
  def addSubcategory
    dp
  
    @category = Category.all
  	@subcategory = Subcategory.new(main_params)
  	if @subcategory.valid?
  		@subcategory.save
   		redirect_to :controller=>'product',:action=>'product'
  	else
  		@object = @subcategory.errors.full_messages
  		render 'subcategory'
  	end
  end

  def show
    dp
    @page_title = "Sub Category Details" 
    @category = Category.all
    @subcategory = Subcategory.order(subcategory: :desc).page params[:page]
  end

  def edit 
    dp

    @page_title = "Sub Category Details" 
    @category = Category.all
    @subcategory = Subcategory.find(params[:id]) 
    if @subcategory
      render 'edit'
  else
    redirect_to :action=>"show"
  end
  end

  def updateSubcategory
    dp
    
  	@subcategory=Subcategory.find(params[:id])
    if @subcategory.valid?
      @subcategory.update_attributes(main_params)
      redirect_to :action=> 'show'
    else
      @object=@subcategory.errors.full_messages
     render 'edit'
      
    end
  end
  # def delete
  #   @id = params[:id]
  #   @subcategory = Subcategory.find_by_id(@id)
  #   if @subcategory.destroy
  #     redirect_to :action=>'show'
  #   else
  #     render 'error'
  #   end
  # end

  def main_params
  	return params.require(:subcategory).permit(:category_id,:subcategory,:is_active,:created_by,:updated_by)
  end
end
