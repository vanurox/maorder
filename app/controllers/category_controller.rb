class CategoryController < ApplicationController
  layout 'admin'
  before_filter :confirm_login
  include ApplicationHelper
  def category
    dp
    @page_title = "Category Details"
    if params[:id]
      @id = params[:id]
      @main = Maincategory.where("id = #{@id}")
    else
      @main = Maincategory.all
    end
  end

  def addCategory
    dp
    @page_title = "Category Details"
    @main = Maincategory.all
  	@category = Category.new(main_params)
  	if @category.valid?
  		@category.save
      @id = @category.id
  		@msg = "Saved Succesfully"
  		redirect_to :controller=>'subcategory',:action=>'subcategory',:id =>@id
  	else
  		@object = @category.errors.full_messages
  		render 'category'
  	end
  end

  def show

    dp
    @page_title = "Category Details"
    @category = Category.order(category: :desc).page params[:page]
  	
  end

  def edit
  dp
    @page_title = "Category Details"
    @main = Maincategory.all
    @category = Category.find(params[:id]) 
    if @category
      render 'edit'
    else
      redirect_to :action=>"show"
    end
  end

  def updateCategory
    dp
    
  	@category=Category.find(params[:id])
    if @category.valid?
      @category.update_attributes(main_params)
      redirect_to :action=> 'show'
    else
      @object=@category.errors.full_messages
      render 'edit'
      
    end
  end

  # def delete
  #   @id = params[:id]
  #   @category = Category.find_by_id(@id)
  #   if @category.destroy
  #     redirect_to :action=>'show'
  #   else
  #     render 'error'
  #   end
  # end

  def view
    dp
    @page_title = "Category Details"
    @id = params[:id]
    @category = Category.find_by_id(@id)
    if @category
      render 'view'
    else
    redirect_to :action=>'show' 
    end
  end
  
  def main_params
  	return params.require(:category).permit(:maincategory_id,:category,:is_active,:created_by,:updated_by)
  end
end
